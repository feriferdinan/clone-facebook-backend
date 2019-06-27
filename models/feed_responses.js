'use strict';
module.exports = (sequelize, DataTypes) => {
  const feed_responses = sequelize.define('feed_responses', {
    feed_id: DataTypes.INTEGER,
    response_id: DataTypes.INTEGER,
    user_id: DataTypes.INTEGER
  }, {});
  feed_responses.associate = function(models) {
    // associations can be defined here
  };
  return feed_responses;
};