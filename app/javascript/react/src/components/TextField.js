import React from 'react';

const TextField = (props) => {
  return(
    <div className="small-12 medium-10 large-10 columns">
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
