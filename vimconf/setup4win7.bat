: =====================================
: �z�[���f�B���N�g���Ƀn�[�h�����N�𒣂�i�V���{���b�N�����N���ƕҏW�Ń����N���؂�邽�߁j
: =====================================
mklink /H %homepath%\_vimrc %cd%\vimrc
mklink /H %homepath%\_gvimrc %cd%\gvimrc
mklink /D %homepath%\vimfiles %cd%\vim

: ====================================
: bundle�f�B���N�g�����쐬
: �� submodule �̋��������������Ȃ邽�߁Agit�ł����͊Ǘ����Ȃ�
: ====================================
mkdir %cd%\vim\bundle

: Vundle���񓱓�  ----------------------------------------------
git clone git://github.com/Shougo/neobundle.vim.git %cd%\vim\bundle\neobundle.vim

: submodule �ɒǉ����Ă���v���O�C�����C���X�g�[������ --------
git submoduele update --init
