// <%= javascript_pack_tag 'hello_react' %>

import React from 'react';
import {render} from 'react-dom';
import PropTypes from 'prop-types'

const Hello = (props) => <h3>Hwllo{props.name}</h3>

Hello.defaultProps = {name: "Manish"}

Hello.propTypes = {name: PropTypes.string}

document
    .addEventListener(
        'DOMContentLoaded',
        () => render(
            <Hello name={"React"}/>,
            document.appendChild(document.createElement('div', addClass('root')))
        ))