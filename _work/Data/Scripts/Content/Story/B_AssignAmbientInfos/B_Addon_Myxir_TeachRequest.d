///////////////////////////////////////////////////////////////////////
//	Info B_DIA_Addon_Myxir_TeachRequest
///////////////////////////////////////////////////////////////////////
func void B_DIA_Addon_Myxir_TeachRequest ()
{
	AI_Output	(other, self, "DIA_Addon_Myxir_TeachRequest_15_00"); //Nau� m� tomu jazyku.
}; 

func void B_DIA_Addon_Myxir_TeachL1 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_00"); //Za�neme od nejjednodu���ho. Nejd��v t� tedy nau��m jazyku roln�k�.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_01"); //Z�kladn�m pravidlem p�semn�ch z�znam� roln�k� je, �e se zab�vaj� sv�tsk�mi z�le�itostmi, jako je pr�ce, l�ska nebo z�sk�v�n� potravy.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL1_12_02"); //B�val to b�n� jazyk ve m�stech. Pokud jej zn�, dok�e� pochopit v�t�inu zdej��ch text�.
};

func void B_DIA_Addon_Myxir_TeachL2 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_00"); //Jazykem roln�k� u� vl�dne�, ale jazyk v�le�n�k� je o n�co obt�n�j��.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL2_12_01"); //Texty v tomto jazyce se v�t�inou t�kaj� zbran� a v�l�en�. I ty by ses z jejich z�znam� mohl lec�emus p�iu�it.
};

func void B_DIA_Addon_Myxir_TeachL3 ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_00"); //Vyt��ben� jazyk kn�� je skute�n� obt�n� pochopit, ale r�d ti s t�m pomohu.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_01"); //Je to jazyk posv�tn�ch text�, kter� pojedn�vaj� o historii a o magii stvo�itel�.
	AI_Output	(self, other, "DIA_Addon_Myxir_TeachL3_12_02"); //Ka�d� z t�chto text� je skute�n�m pokladem, kdy� v�, co znamen�.
};

func void B_DIA_Addon_Myxir_TeachNoMore ()
{
	AI_Output 	(self, other,"DIA_Addon_Myxir_TeachNoMore_12_00"); //V�c u� t� nau�it nemohu. Jazyk stavitel� jsi u� pln� zvl�dl.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X ()
{
	AI_Output	(self, other, "DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00"); //B� si vyzkou�et sv� nov� znalosti. Uvid�, �e jazyk stavitel� u� ti nebude tak nepochopitelnou z�hadou.
};



