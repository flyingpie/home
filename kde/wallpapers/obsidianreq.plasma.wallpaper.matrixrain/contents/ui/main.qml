import QtQuick 2.15
import org.kde.plasma.plasmoid 2.0

WallpaperItem {
    id: main
    anchors.fill: parent

    property int fontSize: main.configuration.fontSize !== undefined ? main.configuration.fontSize : 32 // "colCount"
    property int minFontSize: main.configuration.minFontSize !== undefined ? main.configuration.minFontSize : 12
    property int maxFontSize: main.configuration.maxFontSize !== undefined ? main.configuration.maxFontSize : 26
    property int speed: main.configuration.speed !== undefined ? main.configuration.speed : 50
    property int colorMode: main.configuration.colorMode !== undefined ? main.configuration.colorMode : 0
    property color singleColor: main.configuration.singleColor !== undefined ? main.configuration.singleColor : "#00ff00"
    property int paletteIndex: main.configuration.paletteIndex !== undefined ? main.configuration.paletteIndex : 0
    property real jitter: main.configuration.jitter !== undefined ? main.configuration.jitter : 0
    property int glitchChance: main.configuration.glitchChance !== undefined ? main.configuration.glitchChance : 1
    property real minSpeed: main.configuration.minSpeed !== undefined ? main.configuration.minSpeed : 0.1
    property real maxSpeed: main.configuration.maxSpeed !== undefined ? main.configuration.maxSpeed : 1.8
    property real minAlpha: main.configuration.minAlpha !== undefined ? main.configuration.minAlpha : 0.25
    property real maxAlpha: main.configuration.maxAlpha !== undefined ? main.configuration.maxAlpha : 1.0

    property var palettes: [
        ["#00ff00","#ff00ff","#00ffff","#ff0000","#ffff00","#0000ff"],
        ["#ff0066","#33ff99","#ffcc00","#6600ff","#00ccff","#ff3300"],
        ["#ff00ff","#00ffcc","#cc00ff","#ffcc33","#33ccff","#ccff00"]
    ]

    Canvas {
        id: canvas
        anchors.fill: parent
        property var drops: []
        property var drops_speed: []
        property var drops_fontSize: []
        property var drops_x_offset: []
        property var drops_brightness: []
        property var init: true

        function initDrops() {
            init = true

            drops = []
            var cols = Math.floor(canvas.width / main.fontSize)
            for (var j = 0; j < cols; j++) {
                drops.push(Math.floor(Math.random() * canvas.height / main.fontSize))
                drops_speed.push(main.minSpeed + Math.random() * (main.maxSpeed - main.minSpeed))
                drops_fontSize.push(main.minFontSize + Math.random() * (main.maxFontSize - main.minFontSize))
                drops_brightness.push(main.minAlpha + Math.random() * (main.maxAlpha - main.minAlpha))
            }
        }

        Timer {
            id: timer
            interval: 1000 / main.speed
            running: true
            repeat: true
            onTriggered: canvas.requestPaint()
        }

        onPaint: {
            var ctx = getContext("2d"), w = width, h = height
            ctx.globalAlpha = 1.0
            ctx.fillStyle = "rgba(0,0,0,0.05)"
            ctx.fillRect(0,0,w,h)
            for (var i = 0; i < drops.length; i++) {
                var x = i * main.fontSize
                var y = drops[i] * main.fontSize

                var color = main.colorMode === 0
                    ? main.singleColor
                    : main.palettes[main.paletteIndex][i % main.palettes[main.paletteIndex].length]
                const fontSize = drops_fontSize[i];
                // glitch chance percent
                if (Math.random() < main.glitchChance / 100) {
					ctx.fillStyle = "#ffffff"
					ctx.font = `bold ${fontSize}px monospace`
                } else {
                    ctx.fillStyle = color
                    //ctx.fillStyle = `rgba(100, 100, 255, ${drops_brightness[i]})`
                    //ctx.fillStyle = `${color}${drops_brightness[i]})`
                    ctx.globalAlpha = drops_brightness[i]
                }
                ctx.font = fontSize + "px monospace"
                ctx.fillText(String.fromCharCode(0x30A0 + Math.floor(Math.random() * 96)), x + drops_x_offset[i], y)
                // advance with jitter
                const speed = drops_speed[i]
                drops[i] = (drops[i] + speed + Math.random() * main.jitter) //

                if (y > h) {
                    drops[i] = drops[i] % (h / main.fontSize)
                    drops_speed[i] = main.minSpeed + Math.random() * (main.maxSpeed - main.minSpeed)
                    drops_fontSize[i] = main.minFontSize + Math.random() * (main.maxFontSize - main.minFontSize)
                    drops_x_offset[i] = -30 + Math.random() * 60
                    drops_brightness[i] = main.minAlpha + Math.random() * (main.maxAlpha - main.minAlpha)
                }
            }
        }

        Component.onCompleted: initDrops()
    }

    onFontSizeChanged: { canvas.initDrops(); canvas.requestPaint(); }
    onSpeedChanged: timer.interval = 1000 / main.speed;
    onColorModeChanged: canvas.requestPaint();
    onSingleColorChanged: canvas.requestPaint();
    onPaletteIndexChanged: canvas.requestPaint();
    onJitterChanged: canvas.requestPaint();
    onGlitchChanceChanged: canvas.requestPaint();
}
