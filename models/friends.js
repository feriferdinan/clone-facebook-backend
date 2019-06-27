'use strict';
module.exports = (sequelize, DataTypes) => {
  const friends = sequelize.define('friends', {
    person: DataTypes.INTEGER,
    other_person: DataTypes.INTEGER,
    status: DataTypes.ENUM('accepted','requested')
  }, {});
  friends.associate = function(models) {
    // associations can be defined here
  };
  return friends;
};