// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_9_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_9_EXIT_Condition;
	information	= DIA_PAL_9_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_9_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_9_JOIN_Condition;
	information	= DIA_PAL_9_JOIN_Info;
	permanent	= TRUE;
	description = "Jak se mohu st�t paladinem?";
};                       

FUNC INT DIA_PAL_9_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_JOIN_15_00"); //Jak se mohu st�t paladinem?
	AI_Output (self, other, "DIA_PAL_9_JOIN_09_01"); //Jen ten, kdo v Innosov�ch �i kr�lov�ch slu�b�ch prok�e, �e je toho hoden, se m��e st�t vyvolen�m!
	AI_Output (self, other, "DIA_PAL_9_JOIN_09_02"); //Jinak �e�eno: Vybr�ni mohou b�t jen ti nejlep��. Ale TY do toho m� hodn� daleko, hochu!
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_9_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_9_PEOPLE_Condition;
	information	= DIA_PAL_9_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tomu tady vel�?";
};                       

FUNC INT DIA_PAL_9_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_PEOPLE_15_00"); //Kdo tomu tady vel�?
	AI_Output (self, other, "DIA_PAL_9_PEOPLE_09_01"); //Lord Hagen.
	AI_Output (other, self, "DIA_PAL_9_PEOPLE_15_02"); //A?
	AI_Output (self, other, "DIA_PAL_9_PEOPLE_09_03"); //A nikdo dal��. Lord Hagen je nejvy���m velitelem cel�ho ostrova.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_9_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_9_LOCATION_Condition;
	information	= DIA_PAL_9_LOCATION_Info;
	permanent	= TRUE;
	description = "Pro� paladinov� p�i�li do Khorinidu?";
};                       

FUNC INT DIA_PAL_9_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_9_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_LOCATION_15_00"); //Pro� jste vy, paladinov�, p�i�li do Khorinidu?
	AI_Output (self, other, "DIA_PAL_9_LOCATION_09_01"); //Do toho ti nic nen�, p��teli! Mus� ti sta�it, �e jsme tu v Innosov�ch a kr�lov�ch slu�b�ch!
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_9_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_9_STANDARD_Condition;
	information	= DIA_PAL_9_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak to jde?";
};
                       
func INT DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_9_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_9_STANDARD_15_00"); //Co se stalo?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_9_STANDARD_09_01"); //Te� kdy� v�me, �e m�me co do �in�n� s draky, za�ne n� velitel ur�it� brzy n�co d�lat.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_9_STANDARD_09_02"); //Je�t� st�le nem�me ��dn� zpr�vy od na�ich mu�� z Hornick�ho �dol�. To je velmi znepokojiv�.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_9_STANDARD_09_03"); //D�ky Innosovi! Dra�� hrozba byla za�ehn�na. Te� u� se mus�me jen vypo��dat s t�mi sk�ety a cesta k rud� je voln�.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_9_STANDARD_09_04"); //Jestli je to v�echno, co mi m��e� ��ct, tak u� se ztra�, p��teli!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_9 (var c_NPC slf)
{
	DIA_PAL_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_9_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_9_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_9_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_9_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
