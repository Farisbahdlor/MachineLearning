// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract NeuralNetwork{

    
    struct Neuron {
        string Label;
    }
    
    uint256 public Dimension;

    mapping (uint256 => Neuron) public Neurons;

    function defineNeuronLayers (uint256 _dimension) public returns (bool){
        
        Dimension = _dimension;
        return true;
    }

    function training (uint [] memory _input, string memory _label) public returns (uint256){
        uint256 weight = 0;
        for (uint256 i = 0; i<Dimension; i++ ){
            for (uint256 j = i*10; j<(Dimension*(i+1)); j++){
                weight += ((j-(i*10)+1) * _input[j]);
            }
        }
        Neurons[weight].Label = _label;
        return weight;
    }

    function input (uint [] memory _input) public view returns (string memory){
        uint256 weight = 0;
        for (uint256 i = 0; i<Dimension; i++ ){
            for (uint256 j = i*10; j<(Dimension*(i+1)); j++){
                weight += ((j-(i*10)+1) * _input[j]);
            }
        }
        return Neurons[weight].Label;
    }
    


}
