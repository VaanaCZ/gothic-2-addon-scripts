// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_4_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_4_EXIT_Condition;
	information	= DIA_PAL_4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_4_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_4_JOIN_Condition;
	information	= DIA_PAL_4_JOIN_Info;
	permanent	= TRUE;
	description = "Jak bych se mohl st�t paladinem?";
};                       

FUNC INT DIA_PAL_4_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_JOIN_15_00"); //Jak bych se mohl st�t paladinem?
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_01"); //Pokud to mysl� v�n�, m�l bys nejprve vstoupit do jejich slu�eb.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_02"); //Zajdi do kas�ren a promluv si s lordem Andrem. Nech se p�ijmout k domobran�.
	AI_Output (self, other, "DIA_PAL_4_JOIN_04_03"); //Pak mo�n� dostane� �anci uk�zat, co v tob� v�z�.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_4_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_4_PEOPLE_Condition;
	information	= DIA_PAL_4_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tomu tady vel�?";
};                       

FUNC INT DIA_PAL_4_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_PEOPLE_15_00"); //Kdo tomu tady vel�?
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_01"); //Velitelem v�ech jednotek na ostrov� je lord Hagen. Ten tak� po celou dobu na�� p��tomnosti ve m�st� zast�v� ��ad m�stodr��c�ho.
	AI_Output (self, other, "DIA_PAL_4_PEOPLE_04_02"); //Ale je velmi zanepr�zdn�n�. Pokud pot�ebuje� n�co za��dit, zajdi do kas�ren za lordem Andrem.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_4_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_4_LOCATION_Condition;
	information	= DIA_PAL_4_LOCATION_Info;
	permanent	= TRUE;
	description = "Co vy paladinov� d�l�te tady v Khorinidu?";
};                       

FUNC INT DIA_PAL_4_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_4_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_LOCATION_15_00"); //Co d�l�te vy, paladinov�, tady v Khorinidu?
	AI_Output (self, other, "DIA_PAL_4_LOCATION_04_01"); //To ti nem��u ��ct.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_4_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_4_STANDARD_Condition;
	information	= DIA_PAL_4_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};
                       
func INT DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_4_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_4_STANDARD_15_00"); //Co je nov�ho?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_01"); //Te� kdy� v�me, �e m�me co do �in�n� s draky, za�ne n� velitel ur�it� brzy n�co d�lat.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_4_STANDARD_04_02"); //Je�t� st�le nem�me ��dn� zpr�vy od na�ich mu�� z Hornick�ho �dol�. To je velmi znepokojiv�.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_4_STANDARD_04_03"); //D�ky Innosovi! Dra�� hrozba byla za�ehn�na. Te� u� se mus�me jen vypo��dat s t�mi sk�ety a cesta k rud� je voln�.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_4_STANDARD_04_04"); //Nem�m �as zab�vat se ka�d�m drbem, co se po m�st� ����.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_4 (var c_NPC slf)
{
	DIA_PAL_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_4_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_4_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
