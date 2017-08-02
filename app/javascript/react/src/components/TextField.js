import React from 'react';

const TextField = (props) => {
  return(
    <div>
      <label onChange={props.handleChange}>{props.label}
        <input
          name={props.name}
          type='text'
          value={props.content}
        />
      </label>
    </div>
  );
}

export default TextField;
