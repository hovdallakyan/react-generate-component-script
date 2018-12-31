#!/bin/bash

NEW_DIR="$1"
ORIG_DIR=$(pwd)    
[[ -d $NEW_DIR ]] && echo $NEW_DIR already exists, aborting && exit    
mkdir  $NEW_DIR    
cd $NEW_DIR    
pwd;

if [ "$2" = "c" ];
then
  echo "import React, { Component } from 'react';

class $1 extends Component {
  render() {
    return <h1>$1 component</h1>;
  }
}

export default $1;" >> index.js;
else 
  echo "import React from 'react';
  
const $1 = () => (
  <div>$1 component </div>
)

export default $1;" >> index.js;
fi

