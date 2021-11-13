

function drawFlower(ctx, x0, y0, r, theta, style) {
    ctx.beginPath()
    times(5, (i) => {
        const a0 = ((theta + 72 * i) / 180) * Math.PI
        const a1 = ((theta + 72 * i + 72) / 180) * Math.PI
        const a0x = x0 + r * Math.cos(a0)
        const a0y = y0 + r * Math.sin(a0)
        const centerX = x0 + 0.5 * r * (Math.cos(a0) + Math.cos(a1))
        const centerY = y0 + 0.5 * r * (Math.sin(a0) + Math.sin(a1))
        const centerR = r * Math.sin((36 * Math.PI) / 180)
        const startAngle = Math.atan2(a0y - centerY, a0x - centerX)
        const endAngle = startAngle + Math.PI
        ctx.arc(centerX, centerY, centerR, startAngle, endAngle)
    })
    ctx.closePath()
    ctx.fillStyle = style
    ctx.strokeStyle = '#dddddd'
    ctx.fill()
    ctx.stroke()
}

function drawCanvas() {
    const canvases = document.getElementsByClassName('flower-canvas');
    if (!canvases) {
        return
    }
    const canvas = canvases[0];
    const ctx = canvas.getContext('2d')

    if (!ctx) {
        return
    }

    const pr = window.devicePixelRatio || 1
    const w = window.innerWidth
    const h = window.innerHeight

    canvas.width = w * pr
    canvas.height = h * pr
    ctx.scale(pr, pr)
    ctx.globalAlpha = 0.25

    ctx.clearRect(0, 0, w, h)
    const randomNess = () => Math.random()
    const index = Math.floor(Math.random() * 4)
    times(30, () =>
        drawFlower(
            ctx,
            0.5 * w + w * Math.sin(randomNess() - 0.5),
            h * randomNess(),
            0.02 * h + 0.02 * w * randomNess(),
            360 * randomNess(),
            colorList[index],
        ),
    )
}
