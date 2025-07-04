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
        const [confirm, cancel] = element.querySelectorAll('#buttons > button')
        confirm.addEventListener('click', () => {
            fetch(`https://${GetParentResourceName()}/confirm`)
            document.body.replaceChildren()
        })
        cancel.addEventListener('click', () => {
            fetch(`https://${GetParentResourceName()}/cancel`)
            document.body.replaceChildren()
        })
        document.body.appendChild(element)

    }
}

window.addEventListener('message', ({data}) => Fight[data.shift()]?.(...data))