:// �z�[���f�B���N�g���ɃV���{���b�N�����N�𒣂�
mklink %homepath%\_vimrc %cd%\vimrc
mklink %homepath%\_gvimrc %cd%\gvimrc
mklink /D %homepath%\vimfiles %cd%\vim

:// bundle�f�B���N�g�����쐬
:// �� submodule �̋��������������Ȃ邽�߁Agit�ł����͊Ǘ����Ȃ�
mkdir %cd%\vim\bundle
:// Vundle���񓱓�
git clone https://github.com/gmarik/vundle.git %cd%\vim\bundle\vundle

:// submodule �ɒǉ����Ă���v���O�C�����C���X�g�[������
git submoduele update --init
