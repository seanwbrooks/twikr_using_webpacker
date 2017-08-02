import React from 'react';

const TextArea = (props) => {
  return(
    <div>
      <label onChange={props.handleChange}>{props.label}
        <textarea
          name={props.name}
          type='text'
          value={props.content}
        />
      </label>
    </div>
  );
}

export default TextArea;
