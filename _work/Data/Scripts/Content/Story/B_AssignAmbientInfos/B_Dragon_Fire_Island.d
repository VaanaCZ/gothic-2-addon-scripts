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
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Restez, humain. Tous mes sens me hurlent que celui qui a assassin� ma chair et mon sang se tient devant moi.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //Vraiment ? Qui traitez-vous d'assassin, rejeton de l'enfer ?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Cela ne vous a-t-il pas suffi de d�truire presque toute notre descendance ?
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Le meurtre de mon fr�re Feomathar p�se sur votre conscience et vous allez payer pour �a.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //Je m'occuperai �galement du reste de votre immonde prog�niture.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrhh. Je vais vous br�ler vif avec le plus grand plaisir.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Arr�tez de gesticuler et venons-en aux choses s�rieuses.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Vous avez �t� tr�s loin, petit humain, mais vous ne quitterez jamais cet endroit vivant.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Un autre dragon de feu. Je commence � en avoir ras le bol de ces bestioles. Tout ce que je veux, c'est franchir le gouffre qui se trouve derri�re le dragon de feu."); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

