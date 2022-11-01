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
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Stůj, člověče. Všechny mé smysly mi říkají, že vrah mé vlastní krve stojí právě přede mnou.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //Vážně? Komu říkáš vrahu, ty zplozenče pekel?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Copak ti nestačí, žes vyvraždil všechny moje potomky?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Máš na svědomí mého bratra Feomathara a za to zaplatíš.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //A taky dostanu i zbytek těch tvých odporných mláďat.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrr. Bude mi potěšením tě usmažit zaživa.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Přestaň dělat takovej rámus. Vrátíme se k věci.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Došel jsi daleko, človíčku, ale tyhle síně nikdy živý neopustíš.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Další ohnivý drak. Začínám mít těch bestií fakt plné zuby. A to se chci jenom dostat přes rokli, která se otvírá právě za touhle ohnivou potvorou!"); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

