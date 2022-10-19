// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Island_Exit(C_INFO)
{
	
	npc 		= Dragon_Fire_Island;
	nr			= 999;
	condition	= DIA_Dragon_Fire_Island_Exit_Condition;
	information	= DIA_Dragon_Fire_Island_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Fire_Island_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Fire_Island_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Island_Hello(C_INFO)
{
	
	npc 		= Dragon_Fire_Island;
	nr			= 5;
	condition	= DIA_Dragon_Fire_Island_Hello_Condition;
	information	= DIA_Dragon_Fire_Island_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Fire_Island_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Fire_Island_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //St�j, �lov��e. V�echny m� smysly mi ��kaj�, �e vrah m� vlastn� krve stoj� pr�v� p�ede mnou.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //V�n�? Komu ��k� vrahu, ty zplozen�e pekel?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Copak ti nesta��, �es vyvra�dil v�echny moje potomky?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //M� na sv�dom� m�ho bratra Feomathara a za to zaplat�.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //A taky dostanu i zbytek t�ch tv�ch odporn�ch ml��at.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrr. Bude mi pot�en�m t� usma�it za�iva.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //P�esta� d�lat takovej r�mus. Vr�t�me se k v�ci.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Do�el jsi daleko, �lov��ku, ale tyhle s�n� nikdy �iv� neopust�.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Dal�� ohniv� drak. Za��n�m m�t t�ch besti� fakt pln� zuby. A to se chci jenom dostat p�es rokli, kter� se otv�r� pr�v� za touhle ohnivou potvorou!"); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

