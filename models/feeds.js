'use strict';
module.exports = (sequelize, DataTypes) => {
  const feeds = sequelize.define('feeds', {
    user_id: DataTypes.INTEGER,
    media: DataTypes.STRING,
    content: DataTypes.STRING,
    from_group: DataTypes.STRING
  }, {});
  feeds.associate = function(models) {
    // associations can be defined here
    feeds.belongsTo(models.users,{
      foreignKey:'user_id'
    })
  };
  return feeds;
};