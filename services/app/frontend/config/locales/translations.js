export default {
  ru: {
    buttons: {
      create: "Создать",
      update: "Обновить",
      authorization: "Авторизация",
      createIntegrationSettings: "Задать настройки интеграции",
      ping: "Проверка подключения"
    },
    account: {
      form: {
        title: "Регистрация нового аккаунта",
        name: "Название аккаунта",
        firstName: "Имя владельца аккаунта",
        email: "Email",
        password: "Пароль"
      }
    },
    users: {
      update: {
        success: "Пользователь успешно обновлен",
        error: "При обновлении произошла ошибка"
      },
      attributes: {
        workState: {
          works: "Работает",
          doesntWork: "Не работает"
        },
        gender: {
          male: "Мужской",
          female: "Женский"
        },
        maritalStatus: {
          single: "Холост / Не замужем",
          married: "Женат / Замужем",
          divorced: "Разведен / Разведена",
          widowed: "Вдовец / Вдова",
          civilMarriage: "Гражданский брак"
        }
      },
      table: {
        title: "Сотрудники",
        id: "№",
        firstName: "Имя",
        lastName: "Фамилия",
        email: "Email"
      },
      card: {
        general: {
          title: "Общее",
          workInfo: "Рабочая информация",
          familyInfo: "Личная информация"
        },
        workInfo: {
          title: "Рабочая информация"
        },
        personalInfo: {
          title: "Личная информация",
          firstName: "Имя",
          lastName: "Фамилия",
          patronymic: "Отчество",
          birthdate: "Дата рождения",
          workState: "Статус",
          employeeNumber: "Табельный номер",
          citizenship: "Гражданство",
          birthplace: "Место рождения",
          gender: "Пол",
          maritalStatus: "Семейное положение"
        }
      },
      form: {
        title: "Добавить нового сотрудника",
        firstName: "Имя",
        lastName: "Фамилия",
        email: "Email"
      }
    },
    sidebar: {
      my_information: "Моя информация",
      logout: "Выход",
      integrations: {
        title: "Интеграции",
        moi_krug: "Мой круг"
      },
      users: {
        title: "Сотрудники",
        list: "Список сотрудников",
        newUser: "Добавить нового сотрудника"
      },
      settings: {
        title: "Настройки",
        catalogs: {
          title: "Справочники",
          skills: "Навыки",
          educations: "Образование"
        }
      }
    },
    settings: {
      integrations: {
        moiKrug: {
          form: {
            title: "Создать настройки интеграции с МойКруг",
            clientID: "Client ID",
            clientSecret: "Client Secret"
          }
        }
      },
      skills: {
        table: {
          title: "Навыки",
          id: "№",
          code: "Код",
          name: "Название",
          description: "Описание"
        },
        form: {
          title: "Добавить навык",
          code: "Код",
          name: "Название",
          description: "Описание"
        }
      },
      educations: {
        table: {
          title: "Виды образования",
          id: "№",
          code: "Код",
          name: "Название",
          description: "Описание"
        },
        form: {
          title: "Добавить вид образования",
          code: "Код",
          name: "Название",
          description: "Описание"
        }
      }
    }
  }
};
