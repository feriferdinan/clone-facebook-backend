'use strict';
module.exports = (sequelize, DataTypes) => {
  const feed_comments = sequelize.define('feed_comments', {
    feed_id: DataTypes.INTEGER,
    user_id: DataTypes.INTEGER,
    content: DataTypes.TEXT
  }, {});
  feed_comments.associate = function(models) {
    // associations can be defined here
  };
  return feed_comments;
};