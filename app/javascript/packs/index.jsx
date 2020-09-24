import React from 'react'
import ReactDOM from 'react-dom'

const Hello = () => (
  <div>Ola</div>
);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hello />,
    document.body.appendChild(document.createElement('div'))
  )
})