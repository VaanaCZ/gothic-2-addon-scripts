// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_VLK_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_VLK_1_EXIT_Condition;
	information	= DIA_VLK_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_VLK_1_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_VLK_1_JOIN_Condition;
	information	= DIA_VLK_1_JOIN_Info;
	permanent	= TRUE;
	description = "Jak se m��u st�t ob�anem m�sta?";
};                       

FUNC INT DIA_VLK_1_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_VLK_1_JOIN_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_JOIN_15_00"); //Jak se m��u st�t ob�anem m�sta?
	AI_Output (self, other, "DIA_VLK_1_JOIN_01_01"); //Najdi si slu�nou pr�ci! Ka�d�, kdo je v Khorinidu zam�stn�n, je pova�ov�n za ob�ana m�sta.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_VLK_1_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_VLK_1_PEOPLE_Condition;
	information	= DIA_VLK_1_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady zast�v� d�le�it� funkce?";
};                       

FUNC INT DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_PEOPLE_15_00"); //Kdo tady zast�v� d�le�it� funkce?
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_01"); //(sm�ch) A� doned�vna to byl m�stodr��c� a soudce. Ale pak p�ijeli paladinov� a p�evzali nad m�stem moc.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_02"); //Jejich velitelem je lord Hagen. Je tak� nov�m m�stodr��c�m, v�cem�n�.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_03"); //Lord Andre je jeho pravou rukou. Vel� m�stsk� str�i a tak� zast�v� roli soudce.
	AI_Output (self, other, "DIA_VLK_1_PEOPLE_01_04"); //Ka�d�, kdo se ve m�st� n���m provin�, se zodpov�d� p��mo jemu.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_VLK_1_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_VLK_1_LOCATION_Condition;
	information	= DIA_VLK_1_LOCATION_Info;
	permanent	= TRUE;
	description = "Je v tomhle m�st� n�co zaj�mav�ho?";
};                       

FUNC INT DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_VLK_1_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_LOCATION_15_00"); //Co je ve m�st� zaj�mav�ho?
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_01"); //M��e� tu koupit t�m�� v�e, na co si vzpomene�. Bu� od obchodn�k� na tr�i�ti, nebo v doln� ��sti m�sta.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_02"); //Ale taky skoro v�echno, co si m��e� koupit, n�co stoj�.
	AI_Output (self, other, "DIA_VLK_1_LOCATION_01_03"); //Pokud nem� dost pen�z, m��e ti pomoct lichv�� Lehmar. Pokud p�jde� k dok�m z doln� ��sti m�sta, naraz� na jeho d�m hned u vstupu do p��stavn� �tvrti.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_VLK_1_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_VLK_1_STANDARD_Condition;
	information	= DIA_VLK_1_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};                       
func INT DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_VLK_1_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_VLK_1_STANDARD_15_00"); //Co je nov�ho?
		
	if (Kapitel == 1)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_01"); //Od t� doby, co bari�ra vzala za sv�, se n�hle p�eru�il obchod s velk�mi farm��i. Kdo v�, co maj� za lubem.  Chyst� se n�jak� lev�rna.
	};

	if (Kapitel == 2)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_02"); //Onar za�el moc daleko. Po��d odm�t� z�sobovat m�sto. Jestli domobrana brzy nezas�hne, za�nou si i ostatn� farmy d�lat, co se jim zl�b�.
	};

	if (Kapitel == 3)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_03"); //Sly�el jsem, �e se �oldn��i spojili s m�gy. Mocn�mi temn�mi m�gy v �ern�ch r�b�ch. P��sahal bych, �e jsem jednoho z nich minulou noc zahl�dl ve m�st�.
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_04"); //Sly�el jsem, �e se n�kte�� z Onarov�ch �oldn��� vydali zab�t draky. Kone�n� za�ali d�lat n�co u�ite�n�ho!
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_VLK_1_STANDARD_01_05"); //��k� se, �e draci byli pora�eni! Lord Hagen shroma��uje sv� mu�e, aby v Hornick�m �dol� skoncovali i se zb�vaj�c�mi nestv�rami.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_VLK_1 (var c_NPC slf)
{
	DIA_VLK_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
