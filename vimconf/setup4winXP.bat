:// �z�[���f�B���N�g���ɃV���{���b�N�����N�𒣂�
fsutil hardlink create "%USERPROFILE%\_vimrc" "%CD%\vimrc"
fsutil hardlink create "%USERPROFILE%\_gvimrc" "%CD%\gvimrc"
linkd "%USERPROFILE%\vimfiles" "%CD%\vim"

:// bundle�f�B���N�g�����쐬
:// �� submodule �̋��������������Ȃ邽�߁Agit�ł����͊Ǘ����Ȃ�
mkdir "%CD%\vim\bundle"
:// Vundle���񓱓�
git clone https://github.com/gmarik/vundle.git vim\bundle\vundle

:// submodule �ɒǉ����Ă���v���O�C�����C���X�g�[������
git submoduele update --init
