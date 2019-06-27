'use strict';
module.exports = (sequelize, DataTypes) => {
  const responses = sequelize.define('responses', {
    name: DataTypes.STRING
  }, {});
  responses.associate = function(models) {
    // associations can be defined here
  };
  return responses;
};