'use strict';
module.exports = (sequelize, DataTypes) => {
  const users = sequelize.define('users', {
    name: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    phone_number: DataTypes.STRING,
    gender: DataTypes.BOOLEAN,
    avatar: DataTypes.STRING
  }, {});
  users.associate = function(models) {
    // associations can be defined here
    users.hasMany(models.feeds, {
    	foreignKey: 'user_id'
    })
  };
  return users;
};