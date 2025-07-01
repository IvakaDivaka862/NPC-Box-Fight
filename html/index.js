const Fight = {

}

window.addEventListener('message', ({data}) => Fight[data.shift()]?.(...data))