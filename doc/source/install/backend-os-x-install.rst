=================================
Installation sous OS X
=================================

Pour installer une version locale de ZdS sur OS X, veuillez suivre les instructions suivantes.

.. note::
  - Si une commande échoue, essayez de savoir pourquoi avant de continuer.
  - Si vous voulez savoir ce qui se cache derrière une commande ``make``, ouvrez le fichier nommé ``Makefile`` présent à la racine du projet.
  - Si une erreur s'est glissée dans la doc, ou si la doc a glissé vers l'obscolescence, ouvrez `un ticket sur notre repo github <https://github.com/zestedesavoir/zds-site/issues/new>`_
  - Si malgré tout vous ne parvenez pas à installer ZdS, n'hésitez pas à ouvrir `un sujet sur le forum <https://zestedesavoir.com/forums/sujet/nouveau/?forum=2>`_


Pré-requis
==========================

Avant de vous lancez dans l'installation de l'environnement de zds, il faut quelques pré-requis :

- Installer `XCode <http://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12>`_ pour pouvoir exécuter des commandes (g)cc.
- Installer `Homebrew <http://brew.sh/>`_ pour récupérer certains paquets utiles pour l'installation des dépendances de ce projet.
- Installer `python 2.7 <https://www.python.org/downloads/mac-osx/>`_
- Installer pip
- Installer `git <https://git-scm.com/book/fr/v1/D%C3%A9marrage-rapide-Installation-de-Git#Installation-sur-Mac>`_
- Installer `gettext <https://www.gnu.org/software/gettext/>`_
- Installer GeoIP (``brew install geoip``)

Après avoir tout installé :

- Cloner le dépôt ZdS (voir `la documentation dédiée <clone-repository.html>`_)
- Placez-vous dans le répertoire zds-site (``cd zds-site/``)

Une fois les pré-requis terminés, vous pouvez vous lancer dans l'installaton de l'environnement de zds.


Installation de virtualenv et de l'environnement
==================================================

.. sourcecode:: bash

    make install-osx

    mkdir ~/.virtualenvs
    echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bash_profile && export WORKON_HOME=$HOME/.virtualenvs
    echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_profile && source /usr/local/bin/virtualenvwrapper.sh


Création de votre environnement :

.. sourcecode:: bash

    mkvirtualenv zdsenv

**À chaque fois** que vous souhaitez travailler dans votre environnement, activez-le via la commande suivante :

.. sourcecode:: bash

    source ~/.virtualenvs/zdsenv/bin/activate

Si vous avez installé virtualenvwrapper, vous pouvez utiliser le raccourcis ``workon zdsenv``.

Pour sortir de votre environnement, tapez ``deactivate``

.. note::
  Une documentation plus complète de cet outil `est disponible ici <http://docs.python-guide.org/en/latest/dev/virtualenvs/#virtualenvwrapper>`_.


Récupération de cairo (svg)
===========================

.. sourcecode:: bash

  brew install cairo --without-x11
  brew install py2cairo # py3cairo quand ZdS sera en python 3


Installation de toutes les dépendances
======================================

Une fois dans votre environnement python (``source ../bin/activate`` si vous utilisez virtualenv, très fortement conseillé), installez les dépendances :

.. sourcecode:: bash

  make install-back
  make install-front


Installation des outils front-end
=================================

Il vous faut installer les outils du front-end. Pour cela, rendez-vous sur `la documentation dédiée <frontend-install.html>`_.


Lancer ZdS
==========

Une fois dans votre environnement python (``source ../bin/activate`` si vous utilisez virtualenv, très fortement conseillé) et toutes les dépendances installées, lançons ZdS :

.. sourcecode:: bash

    make migrate
    make run-back

Aller plus loin
===============

.. Attention::

    Cette section n'a jamais été testée. Si vous êtes parvenu à installer Latex et Pandoc et à les faire fonctionner avec ZdS, toute contribution à cette documentation est largement la bienvenue !

Pour faire fonctionner ZdS dans son ensemble vous devez installer les outils LateX et Pandoc.

- Téléchagez et installez `BasicTex <http://www.tug.org/mactex/morepackages.html>`_

.. sourcecode:: bash

  brew install texlive-basic

- Téléchargez et installez `Pandoc <https://github.com/jgm/pandoc/releases>`_

.. sourcecode:: bash

  brew install pandoc


Vous pouvez également `indiquer à Git de ne pas effectuer de commit s'il y a des erreurs de formatage dans le code <../utils/git-pre-hook.html>`__.
