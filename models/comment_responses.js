'use strict';
module.exports = (sequelize, DataTypes) => {
  const comment_responses = sequelize.define('comment_responses', {
    comment_id: DataTypes.INTEGER,
    response_id: DataTypes.INTEGER,
    user_id: DataTypes.INTEGER
  }, {});
  comment_responses.associate = function(models) {
    // associations can be defined here
  };
  return comment_responses;
};