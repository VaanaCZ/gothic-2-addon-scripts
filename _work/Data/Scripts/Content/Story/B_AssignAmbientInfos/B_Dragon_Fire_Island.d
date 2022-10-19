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
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Stùj, èlovêèe. Všechny mé smysly mi âíkají, že vrah mé vlastní krve stojí právê pâede mnou.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //Vážnê? Komu âíkáš vrahu, ty zplozenèe pekel?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Copak ti nestaèí, žes vyvraždil všechny moje potomky?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Máš na svêdomí mého bratra Feomathara a za to zaplatíš.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //A taky dostanu i zbytek têch tvých odporných mláëat.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrr. Bude mi potêšením tê usmažit zaživa.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Pâestaà dêlat takovej rámus. Vrátíme se k vêci.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Došel jsi daleko, èlovíèku, ale tyhle sínê nikdy živý neopustíš.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Další ohnivý drak. Zaèínám mít têch bestií fakt plné zuby. A to se chci jenom dostat pâes rokli, která se otvírá právê za touhle ohnivou potvorou!"); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

