'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('feeds', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER(11)
      },
      user_id: {
        type: Sequelize.INTEGER(11),
        reference:{
          model:'users',
          key:'id'
        }
      },
      media: {
        type: Sequelize.STRING
      },
      content: {
        type: Sequelize.STRING
      },
      from_group: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('feeds');
  }
};