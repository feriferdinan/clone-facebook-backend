'use strict';
module.exports = (sequelize, DataTypes) => {
  const stories = sequelize.define('stories', {
    user_id: DataTypes.INTEGER,
    content: DataTypes.STRING,
    media: DataTypes.STRING
  }, {});
  stories.associate = function(models) {
    // associations can be defined here
  };
  return stories;
};