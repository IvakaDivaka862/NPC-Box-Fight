const Fight = {
    OpenMenu(win, npc, xp, money) {
        const element = document.querySelector('template').content.cloneNode(true)
        if (win) {
            element.querySelector('p').innerText = 'Congratulations, you are a real mother fucker! You won the fucking fight, what are you going to do now?'
        } else {
            element.querySelector('p').innerText = 'You lost, you are a fucking peace of shit, go train and come back you little baby'
        }
        if (win) {
            element.getElementById('xp').innerText = `+${xp} XP`
            element.getElementById('money').innerText = `+${money}€`
            element.getElementById('npc').innerText = `You've beaten ${npc} NPCs`
        }
        const [confirm, cancel] = document.querySelectorAll('#rewards > button')
        confirm.addEventListener('click', () => {
            fetch('confirm')
            ocument.body.replaceChild()
        })
        cancel.addEventListener('click', () => {
            fetch('cancel')
            ocument.body.replaceChild()
        })
        document.body.appendChild(element)
    }
}

window.addEventListener('message', ({data}) => Fight[data.shift()]?.(...data))