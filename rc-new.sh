#!/bin/bash

NEW_DIR="$1"
ORIG_DIR=$(pwd)    
[[ -d $NEW_DIR ]] && echo $NEW_DIR already exists, aborting && exit    
mkdir  $NEW_DIR    
cd $NEW_DIR    
pwd;

# Creating A SCSS File With The Component's Name
# Change The .scss To .css Or .less If You Use One Of Those
touch $1.scss;

# If The Second Argument Is 'C', Create A New Class Based Component
if [ "$2" = "c" ];
then
  echo "import React, { Component } from 'react';
import './$1.scss'

class $1 extends Component {
  render() {
    return (
      <div>
      $1 component
      </div>
    );
  }
}

export default $1;" >> ${1}.js;

# Creating A New Functional Component
else 
  echo "import React, { useState } from 'react';
import './$1.scss'
  
const $1 = () => {
  const [count, setCount] = useState(0);

  return (
    <div>
      $1 component 
    </div>
  )
}

export default $1;" >> ${1}.js;
fi

# Creating File For Testing
echo "import React from 'react';
import $1 from './$1';
import renderer from 'react-test-renderer';" >> ${1}.test.js