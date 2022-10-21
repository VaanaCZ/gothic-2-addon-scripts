// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_PAL_12_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_PAL_12_EXIT_Condition;
	information	= DIA_PAL_12_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_PAL_12_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_PAL_12_JOIN_Condition;
	information	= DIA_PAL_12_JOIN_Info;
	permanent	= TRUE;
	description = "Chci se st�t paladinem!";
};                       

FUNC INT DIA_PAL_12_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_JOIN_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_JOIN_15_00"); //Chci se st�t paladinem!
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_01"); //Ty? Nenech se vysm�t! Je�t� nejsi ani �lenem m�stsk�ch str��.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_02"); //Kdybych nevid�l, jakej se� tupej buran, musel bych si myslet, �e ses m� pokusil urazit.
	AI_Output (self, other, "DIA_PAL_12_JOIN_12_03"); //Pouze ti nejlep�� z nejlep��ch v�rn�ch n�sledovn�k� kr�le a na�eho P�na Innose se mohou st�t paladiny.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_PAL_12_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_PAL_12_PEOPLE_Condition;
	information	= DIA_PAL_12_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tomu tady vel�?";
};                       

FUNC INT DIA_PAL_12_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_PEOPLE_15_00"); //Kdo tomu tady vel�?
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_01"); //Ctihodn� lord Hagen. Ale v�e, co se t�k� prost�ho lidu, m� na starosti lord Andre.
	AI_Output (self, other, "DIA_PAL_12_PEOPLE_12_02"); //Najde� ho v kas�rn�ch. Mo�n� bude� m�t �t�st� a v�nuje ti p�r minut sv�ho drahocenn�ho �asu.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_PAL_12_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_PAL_12_LOCATION_Condition;
	information	= DIA_PAL_12_LOCATION_Info;
	permanent	= TRUE;
	description = "Co vy paladinov� d�l�te tady v Khorinidu?";
};                       

FUNC INT DIA_PAL_12_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_PAL_12_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_LOCATION_15_00"); //Co vy paladinov� d�l�te tady v Khorinidu?
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_01"); //Lidi, co maj� takov�hle ot�zky, v�t�inou skon�� na �ibenici d��v, ne� si toho sta�� v�imnout.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_02"); //Jestli lord Andre n�co nesnese, tak je to pr�v� v�dom�, �e na�e posl�n� bylo vyzrazeno.
	AI_Output (self, other, "DIA_PAL_12_LOCATION_12_03"); //No, m�l by sis d�vat v�t�� pozor, na co se pt�.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_PAL_12_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_PAL_12_STANDARD_Condition;
	information	= DIA_PAL_12_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};
                       
func INT DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_PAL_12_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_PAL_12_STANDARD_15_00"); //Jak se vede?

	if (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_01"); //Te� kdy� v�me, �e m�me co do �in�n� s draky, za�ne n� velitel ur�it� brzy n�co d�lat.
			}
			else
			{
				AI_Output (self, other, "DIA_PAL_12_STANDARD_12_02"); //Je�t� st�le nem�me ��dn� zpr�vy od na�ich mu�� z Hornick�ho �dol�. To je velmi znepokojiv�.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output (self, other, "DIA_PAL_12_STANDARD_12_03"); //D�ky Innosovi! Dra�� hrozba byla za�ehn�na. Te� u� se mus�me jen vypo��dat s t�mi sk�ety a cesta k rud� je voln�.
		};
	}
	else //KEIN Paladin
	{
		AI_Output (self, other, "DIA_PAL_12_STANDARD_12_04"); //Ty ve skute�nosti nechce�, abych ti na tu ot�zku odpov�d�l, hochu!
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_PAL_12 (var c_NPC slf)
{
	DIA_PAL_12_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_PAL_12_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_PAL_12_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
