{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "<center>\n",
    "<img src=\"../../img/ods_stickers.jpg\">\n",
    "## Открытый курс по машинному обучению. Сессия № 2\n",
    "</center>\n",
    "Автор материала: программист-исследователь Mail.ru Group, старший преподаватель Факультета Компьютерных Наук ВШЭ Юрий Кашницкий. Материал распространяется на условиях лицензии [Creative Commons CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Можно использовать в любых целях (редактировать, поправлять и брать за основу), кроме коммерческих, но с обязательным упоминанием автора материала."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# <center>Тема 1. Первичный анализ данных с Pandas</center>\n",
    "## <center>Практическое задание. Анализ данных пассажиров \"Титаника\"</center>\n",
    "\n",
    "**Заполните код в клетках (где написано \"Ваш код здесь\") и ответьте на вопросы в [веб-форме](https://goo.gl/SbRcpW).**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "import numpy as np\n",
    "import pandas as pd\n",
    "%matplotlib inline"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Считаем данные из файла в память в виде объекта Pandas.DataFrame**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "data = pd.read_csv('../../data/titanic_train.csv',\n",
    "                  index_col='PassengerId')"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Данные представлены в виде таблицы. Посмотрим на первые 5 строк:**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Survived</th>\n",
       "      <th>Pclass</th>\n",
       "      <th>Name</th>\n",
       "      <th>Sex</th>\n",
       "      <th>Age</th>\n",
       "      <th>SibSp</th>\n",
       "      <th>Parch</th>\n",
       "      <th>Ticket</th>\n",
       "      <th>Fare</th>\n",
       "      <th>Cabin</th>\n",
       "      <th>Embarked</th>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>PassengerId</th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>0</td>\n",
       "      <td>3</td>\n",
       "      <td>Braund, Mr. Owen Harris</td>\n",
       "      <td>male</td>\n",
       "      <td>22.0</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>A/5 21171</td>\n",
       "      <td>7.2500</td>\n",
       "      <td>NaN</td>\n",
       "      <td>S</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Cumings, Mrs. John Bradley (Florence Briggs Th...</td>\n",
       "      <td>female</td>\n",
       "      <td>38.0</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>PC 17599</td>\n",
       "      <td>71.2833</td>\n",
       "      <td>C85</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>1</td>\n",
       "      <td>3</td>\n",
       "      <td>Heikkinen, Miss. Laina</td>\n",
       "      <td>female</td>\n",
       "      <td>26.0</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>STON/O2. 3101282</td>\n",
       "      <td>7.9250</td>\n",
       "      <td>NaN</td>\n",
       "      <td>S</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Futrelle, Mrs. Jacques Heath (Lily May Peel)</td>\n",
       "      <td>female</td>\n",
       "      <td>35.0</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>113803</td>\n",
       "      <td>53.1000</td>\n",
       "      <td>C123</td>\n",
       "      <td>S</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>5</th>\n",
       "      <td>0</td>\n",
       "      <td>3</td>\n",
       "      <td>Allen, Mr. William Henry</td>\n",
       "      <td>male</td>\n",
       "      <td>35.0</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>373450</td>\n",
       "      <td>8.0500</td>\n",
       "      <td>NaN</td>\n",
       "      <td>S</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "             Survived  Pclass  \\\n",
       "PassengerId                     \n",
       "1                   0       3   \n",
       "2                   1       1   \n",
       "3                   1       3   \n",
       "4                   1       1   \n",
       "5                   0       3   \n",
       "\n",
       "                                                          Name     Sex   Age  \\\n",
       "PassengerId                                                                    \n",
       "1                                      Braund, Mr. Owen Harris    male  22.0   \n",
       "2            Cumings, Mrs. John Bradley (Florence Briggs Th...  female  38.0   \n",
       "3                                       Heikkinen, Miss. Laina  female  26.0   \n",
       "4                 Futrelle, Mrs. Jacques Heath (Lily May Peel)  female  35.0   \n",
       "5                                     Allen, Mr. William Henry    male  35.0   \n",
       "\n",
       "             SibSp  Parch            Ticket     Fare Cabin Embarked  \n",
       "PassengerId                                                          \n",
       "1                1      0         A/5 21171   7.2500   NaN        S  \n",
       "2                1      0          PC 17599  71.2833   C85        C  \n",
       "3                0      0  STON/O2. 3101282   7.9250   NaN        S  \n",
       "4                1      0            113803  53.1000  C123        S  \n",
       "5                0      0            373450   8.0500   NaN        S  "
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.head(5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Survived</th>\n",
       "      <th>Pclass</th>\n",
       "      <th>Age</th>\n",
       "      <th>SibSp</th>\n",
       "      <th>Parch</th>\n",
       "      <th>Fare</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>count</th>\n",
       "      <td>891.000000</td>\n",
       "      <td>891.000000</td>\n",
       "      <td>714.000000</td>\n",
       "      <td>891.000000</td>\n",
       "      <td>891.000000</td>\n",
       "      <td>891.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>mean</th>\n",
       "      <td>0.383838</td>\n",
       "      <td>2.308642</td>\n",
       "      <td>29.699118</td>\n",
       "      <td>0.523008</td>\n",
       "      <td>0.381594</td>\n",
       "      <td>32.204208</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>std</th>\n",
       "      <td>0.486592</td>\n",
       "      <td>0.836071</td>\n",
       "      <td>14.526497</td>\n",
       "      <td>1.102743</td>\n",
       "      <td>0.806057</td>\n",
       "      <td>49.693429</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>min</th>\n",
       "      <td>0.000000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.420000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>25%</th>\n",
       "      <td>0.000000</td>\n",
       "      <td>2.000000</td>\n",
       "      <td>20.125000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>7.910400</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>50%</th>\n",
       "      <td>0.000000</td>\n",
       "      <td>3.000000</td>\n",
       "      <td>28.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>14.454200</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>75%</th>\n",
       "      <td>1.000000</td>\n",
       "      <td>3.000000</td>\n",
       "      <td>38.000000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>31.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>max</th>\n",
       "      <td>1.000000</td>\n",
       "      <td>3.000000</td>\n",
       "      <td>80.000000</td>\n",
       "      <td>8.000000</td>\n",
       "      <td>6.000000</td>\n",
       "      <td>512.329200</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "         Survived      Pclass         Age       SibSp       Parch        Fare\n",
       "count  891.000000  891.000000  714.000000  891.000000  891.000000  891.000000\n",
       "mean     0.383838    2.308642   29.699118    0.523008    0.381594   32.204208\n",
       "std      0.486592    0.836071   14.526497    1.102743    0.806057   49.693429\n",
       "min      0.000000    1.000000    0.420000    0.000000    0.000000    0.000000\n",
       "25%      0.000000    2.000000   20.125000    0.000000    0.000000    7.910400\n",
       "50%      0.000000    3.000000   28.000000    0.000000    0.000000   14.454200\n",
       "75%      1.000000    3.000000   38.000000    1.000000    0.000000   31.000000\n",
       "max      1.000000    3.000000   80.000000    8.000000    6.000000  512.329200"
      ]
     },
     "execution_count": 4,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.describe()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Для примера отберем пассажиров, которые сели в Cherbourg (Embarked=C) и заплатили более 200 у.е. за билет (fare > 200).**\n",
    "\n",
    "Убедитесь, что Вы понимаете, как эта конструкция работает. <br>\n",
    "Если нет – посмотрите, как вычисляется выражение в квадратных в скобках."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Survived</th>\n",
       "      <th>Pclass</th>\n",
       "      <th>Name</th>\n",
       "      <th>Sex</th>\n",
       "      <th>Age</th>\n",
       "      <th>SibSp</th>\n",
       "      <th>Parch</th>\n",
       "      <th>Ticket</th>\n",
       "      <th>Fare</th>\n",
       "      <th>Cabin</th>\n",
       "      <th>Embarked</th>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>PassengerId</th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>119</th>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>Baxter, Mr. Quigg Edmond</td>\n",
       "      <td>male</td>\n",
       "      <td>24.0</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>PC 17558</td>\n",
       "      <td>247.5208</td>\n",
       "      <td>B58 B60</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>259</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Ward, Miss. Anna</td>\n",
       "      <td>female</td>\n",
       "      <td>35.0</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>PC 17755</td>\n",
       "      <td>512.3292</td>\n",
       "      <td>NaN</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>300</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Baxter, Mrs. James (Helene DeLaudeniere Chaput)</td>\n",
       "      <td>female</td>\n",
       "      <td>50.0</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>PC 17558</td>\n",
       "      <td>247.5208</td>\n",
       "      <td>B58 B60</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>312</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Ryerson, Miss. Emily Borie</td>\n",
       "      <td>female</td>\n",
       "      <td>18.0</td>\n",
       "      <td>2</td>\n",
       "      <td>2</td>\n",
       "      <td>PC 17608</td>\n",
       "      <td>262.3750</td>\n",
       "      <td>B57 B59 B63 B66</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>378</th>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>Widener, Mr. Harry Elkins</td>\n",
       "      <td>male</td>\n",
       "      <td>27.0</td>\n",
       "      <td>0</td>\n",
       "      <td>2</td>\n",
       "      <td>113503</td>\n",
       "      <td>211.5000</td>\n",
       "      <td>C82</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "             Survived  Pclass  \\\n",
       "PassengerId                     \n",
       "119                 0       1   \n",
       "259                 1       1   \n",
       "300                 1       1   \n",
       "312                 1       1   \n",
       "378                 0       1   \n",
       "\n",
       "                                                        Name     Sex   Age  \\\n",
       "PassengerId                                                                  \n",
       "119                                 Baxter, Mr. Quigg Edmond    male  24.0   \n",
       "259                                         Ward, Miss. Anna  female  35.0   \n",
       "300          Baxter, Mrs. James (Helene DeLaudeniere Chaput)  female  50.0   \n",
       "312                               Ryerson, Miss. Emily Borie  female  18.0   \n",
       "378                                Widener, Mr. Harry Elkins    male  27.0   \n",
       "\n",
       "             SibSp  Parch    Ticket      Fare            Cabin Embarked  \n",
       "PassengerId                                                              \n",
       "119              0      1  PC 17558  247.5208          B58 B60        C  \n",
       "259              0      0  PC 17755  512.3292              NaN        C  \n",
       "300              0      1  PC 17558  247.5208          B58 B60        C  \n",
       "312              2      2  PC 17608  262.3750  B57 B59 B63 B66        C  \n",
       "378              0      2    113503  211.5000              C82        C  "
      ]
     },
     "execution_count": 5,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data[(data['Embarked'] == 'C') & (data.Fare > 200)].head()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Можно отсортировать этих людей по убыванию платы за билет.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style>\n",
       "    .dataframe thead tr:only-child th {\n",
       "        text-align: right;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: left;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>Survived</th>\n",
       "      <th>Pclass</th>\n",
       "      <th>Name</th>\n",
       "      <th>Sex</th>\n",
       "      <th>Age</th>\n",
       "      <th>SibSp</th>\n",
       "      <th>Parch</th>\n",
       "      <th>Ticket</th>\n",
       "      <th>Fare</th>\n",
       "      <th>Cabin</th>\n",
       "      <th>Embarked</th>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>PassengerId</th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "      <th></th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>259</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Ward, Miss. Anna</td>\n",
       "      <td>female</td>\n",
       "      <td>35.0</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>PC 17755</td>\n",
       "      <td>512.3292</td>\n",
       "      <td>NaN</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>680</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Cardeza, Mr. Thomas Drake Martinez</td>\n",
       "      <td>male</td>\n",
       "      <td>36.0</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>PC 17755</td>\n",
       "      <td>512.3292</td>\n",
       "      <td>B51 B53 B55</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>738</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Lesurer, Mr. Gustave J</td>\n",
       "      <td>male</td>\n",
       "      <td>35.0</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>PC 17755</td>\n",
       "      <td>512.3292</td>\n",
       "      <td>B101</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>312</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Ryerson, Miss. Emily Borie</td>\n",
       "      <td>female</td>\n",
       "      <td>18.0</td>\n",
       "      <td>2</td>\n",
       "      <td>2</td>\n",
       "      <td>PC 17608</td>\n",
       "      <td>262.3750</td>\n",
       "      <td>B57 B59 B63 B66</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>743</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>Ryerson, Miss. Susan Parker \"Suzette\"</td>\n",
       "      <td>female</td>\n",
       "      <td>21.0</td>\n",
       "      <td>2</td>\n",
       "      <td>2</td>\n",
       "      <td>PC 17608</td>\n",
       "      <td>262.3750</td>\n",
       "      <td>B57 B59 B63 B66</td>\n",
       "      <td>C</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "             Survived  Pclass                                   Name     Sex  \\\n",
       "PassengerId                                                                    \n",
       "259                 1       1                       Ward, Miss. Anna  female   \n",
       "680                 1       1     Cardeza, Mr. Thomas Drake Martinez    male   \n",
       "738                 1       1                 Lesurer, Mr. Gustave J    male   \n",
       "312                 1       1             Ryerson, Miss. Emily Borie  female   \n",
       "743                 1       1  Ryerson, Miss. Susan Parker \"Suzette\"  female   \n",
       "\n",
       "              Age  SibSp  Parch    Ticket      Fare            Cabin Embarked  \n",
       "PassengerId                                                                    \n",
       "259          35.0      0      0  PC 17755  512.3292              NaN        C  \n",
       "680          36.0      0      1  PC 17755  512.3292      B51 B53 B55        C  \n",
       "738          35.0      0      0  PC 17755  512.3292             B101        C  \n",
       "312          18.0      2      2  PC 17608  262.3750  B57 B59 B63 B66        C  \n",
       "743          21.0      2      2  PC 17608  262.3750  B57 B59 B63 B66        C  "
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data[(data['Embarked'] == 'C') & \n",
    "     (data['Fare'] > 200)].sort_values(by='Fare',\n",
    "                               ascending=False).head()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Пример создания признака.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "def age_category(age):\n",
    "    '''\n",
    "    < 30 -> 1\n",
    "    >= 30, <55 -> 2\n",
    "    >= 55 -> 3\n",
    "    '''\n",
    "    if age < 30:\n",
    "        return 1\n",
    "    elif age < 55:\n",
    "        return 2\n",
    "    else:\n",
    "        return 3"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "age_categories = [age_category(age) for age in data.Age]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "data['Age_category'] = age_categories"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**Другой способ – через `apply`.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "data['Age_category'] = data['Age'].apply(age_category)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**1. Сколько мужчин / женщин находилось на борту?**\n",
    "- 412 мужчин и 479 женщин\n",
    "- 314 мужчин и 577 женщин\n",
    "- 479 мужчин и 412 женщин\n",
    "- 577 мужчин и 314 женщин"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "data['Sex_number'] = data['Sex'].apply(Sex_number)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**2. Выведите распределение переменной `Pclass` (социально-экономический статус) и это же распределение, только для мужчин / женщин по отдельности. Сколько было мужчин 2-го класса?**\n",
    "- 104\n",
    "- 108\n",
    "- 112\n",
    "- 125"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "# Ваш код здесь"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**3. Каковы медиана и стандартное отклонение платежей (`Fare`)? Округлите до 2 десятичных знаков.**\n",
    "- Медиана – 14.45, стандартное отклонение – 49.69\n",
    "- Медиана – 15.1, стандартное отклонение – 12.15\n",
    "- Медиана – 13.15, стандартное отклонение – 35.3\n",
    "- Медиана – 17.43, стандартное отклонение – 39.1"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "# Ваш код здесь"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**4. Правда ли, что люди моложе 30 лет выживали чаще, чем люди старше 60 лет? Каковы доли выживших в обеих группах?**\n",
    "- 22.7% среди молодых и 40.6% среди старых\n",
    "- 40.6% среди молодых и 22.7% среди старых\n",
    "- 35.3% среди молодых и 27.4% среди старых\n",
    "- 27.4% среди молодых и 35.3% среди старых"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "# Ваш код здесь"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**5. Правда ли, что женщины выживали чаще мужчин? Каковы доли выживших в обеих группах?**\n",
    "- 30.2% среди мужчин и 46.2% среди женщин\n",
    "- 35.7% среди мужчин и 74.2% среди женщин\n",
    "- 21.1% среди мужчин и 46.2% среди женщин\n",
    "- 18.9% среди мужчин и 74.2% среди женщин"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "# Ваш код здесь"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**6. Найдите самое популярное имя среди пассажиров Титаника мужского пола?**\n",
    "- Charles\n",
    "- Thomas\n",
    "- William\n",
    "- John"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "# Ваш код здесь"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**7. Сравните графически распределение стоимости билетов и возраста у спасенных и у погибших. Средний возраст погибших выше, верно?**\n",
    "- Да \n",
    "- Нет"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "# Ваш код здесь"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "**8. Как отличается средний возраст мужчин / женщин в зависимости от класса обслуживания? Выберите верные утверждения:**\n",
    "- В среднем мужчины 1-го класса старше 40 лет\n",
    "- В среднем женщины 1-го класса старше 40 лет\n",
    "- Мужчины всех классов в среднем старше женщин того же класса\n",
    "- В среднем люди в 1 классе старше, чем во 2-ом, а те старше представителей 3-го класса"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "metadata": {
    "collapsed": true
   },
   "outputs": [],
   "source": [
    "# Ваш код здесь"
   ]
  }
 ],
 "metadata": {
  "anaconda-cloud": {},
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.6.1"
  },
  "name": "seminar02_practice_pandas_titanic.ipynb"
 },
 "nbformat": 4,
 "nbformat_minor": 1
}