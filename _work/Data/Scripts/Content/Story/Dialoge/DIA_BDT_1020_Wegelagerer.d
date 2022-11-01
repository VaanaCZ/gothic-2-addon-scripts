// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_BDT_1020_Wegelagerer_EXIT(C_INFO)
{
	npc			= BDT_1020_Bandit_L;
	nr			= 999;
	condition	= DIA_Wegelagerer_EXIT_Condition;
	information	= DIA_Wegelagerer_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Wegelagerer_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Wegelagerer_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************
// ------------------------------------------------------------
	const string BDT_1020_Wegelagerer_Checkpoint		= "NW_TROLLAREA_PATH_46"; //Die Brücke
// ------------------------------------------------------------
instance DIA_BDT_1020_Wegelagerer_FirstWarn (C_INFO)
{
	npc			= BDT_1020_Bandit_L;
	nr			= 1;
	condition	= DIA_BDT_1020_Wegelagerer_FirstWarn_Condition;
	information	= DIA_BDT_1020_Wegelagerer_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       
func int DIA_BDT_1020_Wegelagerer_FirstWarn_Condition()
{
	if ((other.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			))
	{
		return TRUE;
	};
};
func void DIA_BDT_1020_Wegelagerer_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00"); //Eh, vous ! Restez où vous êtes !
	AI_Output (other, self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01"); //Que voulez-vous ?
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02"); //Si vous voulez pas que je vous casse la tête, vous feriez bien de me donner quelques pièces d'or et pronto !
	
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
	
 	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Combien voulez-vous ?",DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Vous plaisantez.",DIA_BDT_1020_Wegelagerer_FirstWarn_Joke);
 	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Hors de mon chemin !",DIA_BDT_1020_Wegelagerer_PissOff);
	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Dites ! Avez-vous vu un novice ?",DIA_BDT_1020_Wegelagerer_AGON);
	};
};
FUNC VOID DIA_BDT_1020_Wegelagerer_AGON ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_AGON_15_00"); //Dites-moi, avez-vous vu un novice ?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01"); //(perplexe) Euh... quoi ? Hum, (il réfléchit) ça se pourrait.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02"); //Donnez-moi 20 pièces d'or et je vous le dis !

	Wegelagerer_Surprise = TRUE;

	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Très bien, voici votre argent.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Désolé, je n'ai pas d'argent.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Contentez-vous de vous écarter de mon chemin.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00"); //Combien voulez-vous ?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01"); //(il sourit) 20 pièces d'or et on fera copain-copain..
	
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
	
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Très bien, voici votre argent.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Désolé, je n'ai pas d'argent.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Contentez-vous de vous écarter de mon chemin.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
		
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_Joke ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00"); //Vous plaisantez.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01"); //Est-ce que j'en ai l'air ?
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02"); //Si je ne vois pas 20 pièces d'or avant que vous ne vous approchiez...
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03"); //Alors je vous étale. Alors filez-moi le pognon.
	
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
	
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{ 
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Très bien, voici votre argent.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Désolé, je n'ai pas d'argent.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Contentez-vous de vous écarter de mon chemin.",DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
	
};
FUNC VOID DIA_BDT_1020_Wegelagerer_PissOff ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_PissOff_15_00"); //Hors de mon chemin !
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01"); //Pour un si petit bonhomme vous avez vraiment une grande gueule.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02"); //Il est temps que je vous la ferme.
	
	AI_StopProcessInfos (self);
	
	B_Attack (self ,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00"); //Très bien, voici votre argent.
	
	if (Wegelagerer_Surprise == FALSE)
	{
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01"); //(sarcastique) Je dirais que 20 pièces d'or, ce n'est pas beaucoup pour votre vie. Vous pouvez passer.
	};
	if (Wegelagerer_Surprise == TRUE)
	{
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02"); //Au fait, le novice est passé par ici il y a environ une heure.
		AI_Output (self,other ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03"); //Il semblait assez pressé et il regardait tout le temps derrière lui. Maintenant, du vent.
	};
	B_GiveInvItems (other,self ,itmi_gold,20);
	self.aivar[AIV_PASSGATE]						= TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00"); //Désolé, je n'ai pas d'argent.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01"); //Eh oui, les temps sont durs.
	
	if Npc_HasEquippedMeleeWeapon (other)
	{
		AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02"); //Mais voilà ce qu'on va faire, vous allez me donner votre arme et je vous laisse passer.
	
		Info_ClearChoices (DIA_BDT_1020_Wegelagerer_FirstWarn);
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Oubliez ça.",DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon);
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_FirstWarn,"Tenez, prenez mon arme.",DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon);
	}
	else
	{
		AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03"); //Voilà ce qu'on va faire : revenez quand vous aurez de l'argent. Sans argent, on ne passe pas.
		
		self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
		AI_StopProcessInfos (self);
		
	};		
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_Never ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00"); //Ecartez-vous de mon chemin.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01"); //Alors vous voulez utiliser la manière forte ?
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00"); //Laissez tomber.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01"); //D'accord, la manière forte alors.
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 1);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00"); //Tenez, prenez mon arme.
	
	AI_DrawWeapon (other);
	
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01"); // Ne touchez pas à cette arme. Vous allez voir ce que vous allez voir !
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_GuardStopsIntruder, 1);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_BDT_1020_Wegelagerer_SecondWarn (C_INFO)
{
	npc			= BDT_1020_Bandit_L;
	nr			= 2;
	condition	= DIA_BDT_1020_Wegelagerer_SecondWarn_Condition;
	information	= DIA_BDT_1020_Wegelagerer_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_BDT_1020_Wegelagerer_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};
func void DIA_BDT_1020_Wegelagerer_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00"); //Vous voulez vraiment tenter votre chance ? Comme vous voudrez.
	
	Info_ClearChoices (DIA_BDT_1020_Wegelagerer_SecondWarn);
	if (Npc_HasItems (other,ItMi_gold) >= 20)
	{
		Info_AddChoice (DIA_BDT_1020_Wegelagerer_SecondWarn,"Voici l'argent.",DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney);
	};
	Info_AddChoice (DIA_BDT_1020_Wegelagerer_SecondWarn,"Je ne vous donnerai pas un sou.",DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney);
	
	
	other.aivar[AIV_LastDistToWP] 			= Npc_GetDistToWP (other,BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
};
FUNC VOID DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney ()
{
	
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00"); //Voici votre argent.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01"); //Ah ! Vous parlez maintenant.
	
	B_GiveInvItems (other,self ,itmi_gold,20);
	self.aivar[AIV_PASSGATE]						= TRUE;
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney ()
{
	AI_Output (other,self ,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00"); //Je ne vous donnerai pas un sou.
	AI_Output (self ,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01"); //Alors je vais me servir.
	
	AI_StopProcessInfos (self);
	B_Attack (self ,other,AR_NONE, 1);
	
};
// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_BDT_1020_Wegelagerer_Attack (C_INFO)
{
	npc			= BDT_1020_Bandit_L;
	nr			= 3;
	condition	= DIA_BDT_1020_Wegelagerer_Attack_Condition;
	information	= DIA_BDT_1020_Wegelagerer_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_BDT_1020_Wegelagerer_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1020_Wegelagerer_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};
func void DIA_BDT_1020_Wegelagerer_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_StopProcessInfos	(self);												//dem Spieler sofort wieder die Kontrolle zurückgeben
	
	B_Attack (self, other, AR_NONE, 1);
};
