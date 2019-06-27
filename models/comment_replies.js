'use strict';
module.exports = (sequelize, DataTypes) => {
  const comment_replies = sequelize.define('comment_replies', {
    comment_id: DataTypes.INTEGER,
    user_id: DataTypes.INTEGER,
    content: DataTypes.TEXT
  }, {});
  comment_replies.associate = function(models) {
    // associations can be defined here
  };
  return comment_replies;
};