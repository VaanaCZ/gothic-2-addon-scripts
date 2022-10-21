//************************************************************
//		  					EXIT
//************************************************************
INSTANCE DIA_Addon_Henry_EXIT(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 999;
	condition	= DIA_Addon_Henry_EXIT_Condition;
	information	= DIA_Addon_Henry_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Henry_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// -----------------------------------------------------------
	func void B_Henry_Gold (var int gold)
	{
		if (gold == 500)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold500_04_00"); //500 pièces d'or.
		}
		else if (gold == 400)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold400_04_00"); //400 pièces d'or.
		}
		else if (gold == 300)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold300_04_00"); //300 pièces d'or.
		}
		else if (gold == 200)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold200_04_00"); //200 pièces d'or.
		}
		else if (gold == 100)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold100_04_00"); //100 pièces d'or.
		}
		else
		{
			B_Say_Gold (self, other, gold);
		};
		
	};
// -----------------------------------------------------------

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Henry_PICKPOCKET (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 900;
	condition	= DIA_Addon_Henry_PICKPOCKET_Condition;
	information	= DIA_Addon_Henry_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Henry_PICKPOCKET_Condition()
{
	C_Beklauen (40, 60);
};
 
FUNC VOID DIA_Addon_Henry_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Henry_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Henry_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Henry_PICKPOCKET);
};
	
func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Henry_PICKPOCKET);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************
// ------------------------------------------------------------
const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";	
// ------------------------------------------------------------
instance DIA_Addon_Henry_Hello(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 5;
	condition	= DIA_Addon_Henry_Hello_Condition;
	information	= DIA_Addon_Henry_Hello_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_Hello_Condition()
{
	if (Npc_GetDistToWP(other, PIR_1354_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};
	
	if (self.aivar[AIV_Guardpassage_Status]			== GP_NONE)
	&& (self.aivar[AIV_PASSGATE]					== FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) 						== FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Henry_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_04_00"); //HALTE !
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_04_01"); //Ami ou ennemi !
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
	Info_AddChoice (DIA_Addon_Henry_Hello,"Ennemi !",DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice (DIA_Addon_Henry_Hello,"Ami !",DIA_Addon_Henry_Hello_Freund);
};
var int Henry_SC_Frech;
FUNC VOID DIA_Addon_Henry_Hello_Feind()
{
	AI_Output (other,self ,"DIA_Addon_Henry_Hello_Feind_15_00"); //Ennemi !
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Feind_04_01"); //Vous cherchez des ennuis, sombre crétin ? 
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Feind_04_02"); //Dites-moi ce que vous êtes venu chercher ici ou fichez le camp, et vite !
	
	Henry_SC_Frech = TRUE;

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;	
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
};

FUNC VOID DIA_Addon_Henry_Hello_Freund()
{
	AI_Output (other,self ,"DIA_Addon_Henry_Hello_Freund_15_00"); //Ami !
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Freund_04_01"); //Tout le monde peut le prétendre ! Je ne vous connais pas, que voulez-vous ?
	
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;	
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Addon_Henry_SecondWarn (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 2;
	condition	= DIA_Addon_Henry_SecondWarn_Condition;
	information	= DIA_Addon_Henry_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_SecondWarn_Condition()
{
	if (self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&& (self.aivar[AIV_PASSGATE]					== FALSE								) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE									)
	&& (Npc_GetDistToWP(other,pir_1354_Checkpoint)	<  (other.aivar[AIV_LastDistToWP]-50)	)
	{
		return TRUE;
	};
};
func void DIA_Addon_henry_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Henry_SecondWarn_04_00"); //Un pas de plus en direction du camp et je vous jette en pâture aux requins !

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Addon_Henry_Attack (C_INFO)
{
	npc			= Pir_1354_Addon_Henry;
	nr			= 3;
	condition	= DIA_Addon_Henry_Attack_Condition;
	information	= DIA_Addon_Henry_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       
func INT DIA_Addon_Henry_Attack_Condition()
{
	if (self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&& (self.aivar[AIV_PASSGATE]					== FALSE								) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE									)
	&& (Npc_GetDistToWP(other,Pir_1354_Checkpoint)	<  (other.aivar[AIV_LastDistToWP]-50)	)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Henry_Attack_04_00"); //Vous l'aurez cherché... 
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};



// ************************************************************
// ***														***
// 						Ich will ins Lager
// ***														***
// ************************************************************
// ------------------------------------------------------------
var int Henry_Zoll_WhatFor;
// ------------------------------------------------------------
// 		  				Ich will da rein	   
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_WantEnter(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 1;
	condition	= DIA_Addon_Henry_WantEnter_Condition;
	information	= DIA_Addon_Henry_WantEnter_Info;
	permanent	= FALSE;
	description	= "Je veux y entrer.";
};                       
FUNC INT DIA_Addon_Henry_WantEnter_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Henry_WantEnter_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_WantEnter_15_00"); //Je veux entrer.
	AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_01"); //Vraiment ? Ce ne sera pas gratuit, en tout cas. 

	B_Henry_Gold (500);

	if (Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Henry_WantEnter_15_02"); //Hein ? Et pourquoi ?
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_03"); //Ne vous posez pas tant de questions. 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_04"); //Ce camp regorge de choses qui pourraient vous intéresser...
		Henry_Zoll_WhatFor = TRUE;
	};
		 
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ITAR_KDF_L) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_KDF_H) == TRUE)
	||   (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_MIL_M) == TRUE))
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_07"); //Et vous m'avez tout l'air d'être du genre à transporter une belle quantité d'or. 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_08"); //En quel cas, une petite contribution ne vous tuera pas. 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_09"); //Ou bien est-ce que vous avez volé ces beaux oripeaux à quelqu'un ?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_10"); //Vous avez de l'or, pas vrai ?   
	};
};

// ------------------------------------------------------------
// 							500 zahlen!
// ------------------------------------------------------------
func void B_Henry_NoJoin()
{	
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_00"); //Si vous espériez pouvoir devenir l'un des nôtres, mon gars, vous n'avez pas de chance !
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_01"); //Seul le capitaine peut en décider, et il a pris la mer avec la moitié de l'équipage en quête de nouveaux butins.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_02"); //Mais vous pouvez rester ici jusqu'à ce qu'il rentre.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_03"); //En revanche, arrangez-vous pour ne pas faire de vagues ici !
};
// ------------------------------------------------------------



instance DIA_Addon_Henry_Einigen2		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 2;
	condition	= DIA_Addon_Henry_Einigen2_Condition;
	information	= DIA_Addon_Henry_Einigen2_Info;

	description	= "Voici vos 500 pièces d'or.";
};
func int DIA_Addon_Henry_Einigen2_Condition ()
{
	if (self.aivar[AIV_PASSGATE]					== FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_WantEnter))
	&& (!Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (Npc_HasItems (other,ItMi_Gold) >= 500)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Einigen2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Einigen2_15_00"); //Voici vos 500 pièces d'or.
	B_GiveInvItems (other, self, ItMi_Gold, 500);		
	AI_Output (self, other, "DIA_Addon_Henry_Einigen2_04_01"); //Bien. Bienvenue dans notre camp, alors !  
	B_Henry_NoJoin();
	
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ------------------------------------------------------------
// 								Einigen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Einigen		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 3;
	condition	= DIA_Addon_Henry_Einigen_Condition;
	information	= DIA_Addon_Henry_Einigen_Info;

	description	= "Peut-être pourrions-nous trouver un arrangement...?";
};

func int DIA_Addon_Henry_Einigen_Condition ()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_WantEnter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Einigen_15_00"); //Peut-être pourrions-nous trouver un arrangement...?
	AI_Output (self, other, "DIA_Addon_Henry_Einigen_04_01"); //Soit. Donnez-moi une bonne raison, et peut-être que je baisserai le prix pour vous.
};

// ------------------------------------------------------------
// 		  			Grund 1 - Fleisch für Morgan
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_MeatForMorgan(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 4;
	condition	= DIA_Addon_Henry_MeatForMorgan_Condition;
	information	= DIA_Addon_Henry_MeatForMorgan_Info;
	permanent	= FALSE;
	description	= "Je suis censé apporter cette viande à Morgan.";
};                       
FUNC INT DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& 	(MIS_AlligatorJack_BringMeat == LOG_RUNNING)
	&&	(Npc_HasItems (other,ItFoMuttonRaw) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Henry_MeatForMorgan_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_MeatForMorgan_15_00"); //Je suis censé apporter cette viande à Morgan.
	AI_Output (self ,other,"DIA_Addon_Henry_MeatForMorgan_04_01"); //(sèchement) Aha. Et qui vous envoie ?  
	AI_Output (other,self ,"DIA_Addon_Henry_MeatForMorgan_15_02"); //Alligator Jack. Il m'a dit que Morgan attend déjà cette viande.
	AI_Output (self ,other,"DIA_Addon_Henry_MeatForMorgan_04_03"); //Je vois. Il n'avait pas envie de la livrer lui-même, c'est ça ?  
};

// ------------------------------------------------------------
// 		  			Grund 2 - Holz von Malcom
// ------------------------------------------------------------
instance DIA_Addon_Henry_Malcom		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 5;
	condition	= DIA_Addon_Henry_Malcom_Condition;
	information	= DIA_Addon_Henry_Malcom_Info;

	description	= "C'est Malcom qui m'envoie.";
};
func int DIA_Addon_Henry_Malcom_Condition ()
{
	if  (self.aivar[AIV_PASSGATE]	== FALSE)
	&&  (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&&  (MalcomBotschaft == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Malcom_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Malcom_15_00"); //C'est Malcom qui m'envoie. Il m'a dit que la livraison du bois demanderait encore quelque temps.
	AI_Output (self, other, "DIA_Addon_Henry_Malcom_04_01"); //(râle) Oh, parfait. J'aurais dû m'en douter. Encore une fois, il ne tient pas ses délais.

	B_MalcomExident();
};

// ------------------------------------------------------------
// 		  			Grund 3 - Paket für Skip
// ------------------------------------------------------------
instance DIA_Addon_Henry_BaltramPack		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 6;
	condition	= DIA_Addon_Henry_BaltramPack_Condition;
	information	= DIA_Addon_Henry_BaltramPack_Info;

	description	= "J'ai une livraison pour Skip.";
};
func int DIA_Addon_Henry_BaltramPack_Condition ()
{
	if (self.aivar[AIV_PASSGATE]	== FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_BaltramPack_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_BaltramPack_15_00"); //J'ai une livraison pour Skip. Est-il là ?
	AI_Output (self, other, "DIA_Addon_Henry_BaltramPack_04_01"); //Oui. Skip est là. Et alors ?
};

// ------------------------------------------------------------
// 						ICH WILL JETZT REIN
// ------------------------------------------------------------
var int Henry_Amount;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Tribut		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 7;
	condition	= DIA_Addon_Henry_Tribut_Condition;
	information	= DIA_Addon_Henry_Tribut_Info;
	permanent	= TRUE;
	description = "Laissez-moi entrer.";
};
func int DIA_Addon_Henry_Tribut_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (self.aivar[AIV_PASSGATE] == FALSE)		
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Tribut_Info ()
{
	Henry_Amount = 500;

	AI_Output	(other, self, "DIA_Addon_Henry_Tribut_15_00"); //Laissez-moi entrer.
	
	AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_01"); //Hmm...

	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Malcom))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_02"); //Vous m'avez apporté un message des bûcherons.
		Henry_Amount = (Henry_Amount - 100);
	};	

	if (Npc_KnowsInfo (other, DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_03"); //Vous voulez jouer le messager d'Alligator Jack et porter cette viande de rat des marais à Morgan.
		Henry_Amount = (Henry_Amount - 100);
	};
	
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_BaltramPack))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_04"); //Vous avez une livraison pour Skip.
		Henry_Amount = (Henry_Amount - 100);
	};

	if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if (Henry_Amount < 500) //schon was anderes gesagt
		{
			AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_00"); //Et, surtout :
		};
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_01"); //Vous avez éliminé les crapules qui occupaient la tour.
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_02"); //Jamais je ne vous aurais cru capable de faire tout cela.
		Henry_Amount = (Henry_Amount - 200);
	};

	if (Henry_Amount <= 0)
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_03"); //Je vais vous dire une bonne chose - vous pouvez rentrer gratuitement.
		
		//patch M.F. 
		self.aivar[AIV_PASSGATE] = TRUE; 
		Info_ClearChoices	(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold (Henry_Amount);   

		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_05"); //...ou vous pouvez aller vous faire voir. C'est aussi simple que cela.

		Info_ClearChoices	(DIA_Addon_Henry_Tribut);
		Info_AddChoice	(DIA_Addon_Henry_Tribut, "C'est trop cher.", DIA_Addon_Henry_Tribut_nein );

		if (Npc_HasItems (other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice	(DIA_Addon_Henry_Tribut, "Bien. Voici votre or.", DIA_Addon_Henry_Tribut_ja );
		};
	};
};
func void DIA_Addon_Henry_Tribut_ja ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Tribut_ja_15_00"); //Bien. Voici votre or.
	B_GiveInvItems (other, self, ItMi_Gold, Henry_Amount);		
	AI_Output (self, other, "DIA_Addon_Henry_Tribut_ja_04_01"); //Merci. Bienvenue dans notre camp.
	B_Henry_NoJoin();
	
	Info_ClearChoices	(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE; 
};
func void DIA_Addon_Henry_Tribut_nein ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Tribut_nein_15_00"); //Ça me paraît trop cher.
	if (Henry_Amount < 500)
	{
		AI_Output (self, other, "DIA_Addon_Henry_Tribut_nein_04_03"); //Dites donc, j'ai déjà baissé le prix pour vous.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Henry_Tribut_nein_04_04"); //Allez vous faire voir, alors.
	};
	
	Info_ClearChoices	(DIA_Addon_Henry_Tribut);
};



// ************************************************************
// ***														***
// 				Palisade - Banditen - Turmbanditen
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 		  				Hallo 2 	(Was machst du)	   
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 11;
	condition	= DIA_Addon_Henry_Palisade_Condition;
	information	= DIA_Addon_Henry_Palisade_Info;
	permanent	= FALSE;
	description	= "Que faites-vous ici ?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Palisade_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_15_00"); //Qu'est-ce que vous faites ici ?   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_01"); //A votre avis ? Je suis censé veiller à ce que ces demeurés travaillent à la construction de la palissade.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_02"); //Parce qu'ils ne le font pas, le cap'taine Greg me bottera le derrière à leur place !   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_03"); //De plus, j'empêche les étrangers de rentrer inopinément à l'intérieur du camp...
};

// ------------------------------------------------------------
// 		  				Palisade + Turmbanditen
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade_WhatFor(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 12;
	condition	= DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information	= DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent	= FALSE;
	description	= "Pourquoi construisez-vous cette palissade ?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_WhatFor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_WhatFor_15_00"); //Pourquoi construisez-vous cette palissade ?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10"); //Disons qu'il ne faudrait pas que les bandits aient la vie trop belle !
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02"); //Ces ordures se montrent de plus en plus téméraires. Cela fait des jours qu'ils rôdent autour de notre camp... comme des requins autour d'une épave. 
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11"); //Certains de ces bons à rien se sont terrés dans une tour au sud d'ici.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12"); //Mais ce ne sont que des éclaireurs, j'en suis certain.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03"); //S'ils se montrent vraiment stupides au point de tenter une attaque, on leur réservera un accueil qu'ils ne sont pas près d'oublier.

	Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditsTower,"Quelques bandits ont investi la tour au sud du camp des pirates et l'ont fortifiée.");

};

// ------------------------------------------------------------
// 		  				Turmbanditen Report
// ------------------------------------------------------------
func void B_Henry_WhereIsTower()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_BanditsDead_15_08"); //Où se trouve cette tour, au juste ?
	AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_07"); //En partant du camp, restez toujours sur la droite du sentier.
	AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_08"); //Vous trouverez la tour au sommet d'une petite falaise.
};
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Turmbanditen(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 13;
	condition	= DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information	= DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent	= TRUE;
	description	= "A propos de ces bandits dans la tour...";
};                       
FUNC INT DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Palisade_WhatFor))
	&& (MIS_Henry_FreeBDTTower != LOG_SUCCESS)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Turmbanditen_15_00"); //A propos de ces bandits dans la tour...
	
	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_01"); //Oui ?
		AI_Output (other,self ,"DIA_Addon_Francis_BanditsDead_15_01"); //Ils ne sont plus qu'un mauvais souvenir.
		if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_02"); //Parfait ! Un problème de moins, dans ce cas !
		}
		else //auf eigene Faust
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_03"); //Vous y êtes arrivé par vous-même ? Impressionnant !
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_04"); //Peut-être deviendrez-vous même un vrai pirate, un jour !
		};
		//-----------------------------------------			
		SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(SawPirate,"START");
		HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(HammerPirate,"START");
		//-----------------------------------------	
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		
		B_LogEntry (TOPIC_Addon_BanditsTower,"Les bandits de la tour sont morts.");
		
		B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);
	}
	else if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_07"); //Que voulez-vous d'autre ?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_05"); //Si vous comptez tous les affronter par vous-même, n'y pensez même pas !
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_06"); //Je vais bientôt dépêcher deux hommes de ma troupe de pillage. Laissez-leur le soin d'affronter les bandits.
		Knows_HenrysEntertrupp = TRUE;
	};
};

// ------------------------------------------------------------
// 		  			Warum Krieg mit Banditen
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade_Bandits(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 14;
	condition	= DIA_Addon_Henry_Palisade_Bandits_Condition;
	information	= DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent	= FALSE;
	description	= "Pourquoi les bandits vous attaqueraient-ils ?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_Bandits_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Bandits_15_00"); //Pourquoi les bandits vous attaqueraient-ils ?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_04"); //Parce que la guerre est déclarée entre eux et nous ! Qu'est-ce que vous croyiez ?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_05"); //Au début, tout se passait bien. Nous les avons déposés ici, et ils se sont enfoncés dans leur marais sans rien nous demander.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_06"); //Mais maintenant, ces ordures attaquent tous ceux qui ne sont pas des leurs.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_07"); //Dieu seul sait ce qui leur a pris...
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_08"); //Je crois qu'ils en ont après nos navires. Après tout, sans bateau, vous n'avez pas la moindre chance de quitter cet endroit... 
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_09"); //Vous devriez en parler à Skip. Il a été des leurs - et a tout juste pu leur échapper en vie.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_10"); //Son histoire sera des plus intéressantes pour vous, j'en suis certain...
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_11"); //(avec malice) Quel dommage que vous ne puissiez pas l'entendre... Après tout, vous n'avez toujours pas versé votre droit d'entrée.
		Henry_Zoll_WhatFor = TRUE;
	};
};



// ************************************************************
// ***														***
// 							Entertrupp
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 		  		Ich will in deinen Entertrupp
// ------------------------------------------------------------
var int Henry_EnterCrewMember;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Entercrew(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 31;
	condition	= DIA_Addon_Henry_Entercrew_Condition;
	information	= DIA_Addon_Henry_Entercrew_Info;
	permanent	= TRUE;
	description	= "Je veux faire partie de votre troupe de pillage.";
};                       
FUNC INT DIA_Addon_Henry_Entercrew_Condition()
{
	if (Knows_HenrysEntertrupp == TRUE)
	&& (Henry_EnterCrewMember == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Entercrew_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Entercrew_15_00"); //Je veux faire partie de votre troupe de pillage.
	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_00"); //(rires) Vous ne vous en tirerez pas aussi facilement, mon garçon !
		AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_01"); //D'abord, voyons tout simplement si vous pouvez entrer dans ce camp...
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Entercrew_04_06"); //Bon, alors bienvenue dans les rangs de ma troupe de pillage !
		AI_Output (self ,other,"DIA_Addon_Henry_Entercrew_04_07"); //Un combattant de plus pour mener la vie dure aux bandits ! 
		if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Addon_Henry_Entercrew_Add_04_02"); //Hmm, j'aurais plutôt dû m'exprimer ainsi : prenez un de mes hommes et allez chasser ces ordures de la tour.
			AI_Output (self, other, "DIA_Addon_Henry_Entercrew_Add_04_03"); //Mais apparemment, vous vous en êtes déjà chargé.
		}
		else 
		{
			if (Npc_IsDead(SawPirate))
			&& (Npc_IsDead(HammerPirate))
			{
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_04"); //Eh bien, mes deux hommes sont morts. Il semblerait donc que vous deviez vous en charger seul, après tout.
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_05"); //Débarrassez-nous de ces bandits dans la tour !
				
				B_LogEntry (TOPIC_Addon_BanditsTower,"Henry me demande de déloger les bandits de la tour. En revanche, il ne peut rien faire pour m'aider.");
			}
			else
			{
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_06"); //Prenez l'un de mes hommes et allez me tailler ces bandits en pièces !
				Henry_GetPartyMember = TRUE;
			
				B_LogEntry (TOPIC_Addon_BanditsTower,"Henry me demande de déloger les bandits de la tour. Je dois emmener un de ses hommes avec moi.");
			};

			B_Henry_WhereIsTower();
			
			AI_Output (other,self ,"DIA_Addon_Henry_Entercrew_15_09"); //A vos ordres, mon capitaine !
	
			MIS_Henry_FreeBDTTower = LOG_RUNNING;
		};
		Henry_EnterCrewMember = TRUE;
	};
};

// ------------------------------------------------------------
// 						Dann geh zu Owen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 32;
	condition	= DIA_Addon_Henry_Owen_Condition;
	information	= DIA_Addon_Henry_Owen_Info;

	description	= "Voulez-vous que je fasse autre chose ?";
};
func int DIA_Addon_Henry_Owen_Condition ()
{
	if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	&& (Henry_EnterCrewMember == TRUE)
	&& (!Npc_IsDead (Malcom))
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Owen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Owen_15_01"); //Voulez-vous que je fasse autre chose ?
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_01"); //Cela fait plusieurs jours que nous attendons du bois pour construire notre palissade. 
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_05"); //Malcom et Owen devraient déjà être rentrés depuis quelque temps.
	if (!Npc_KnowsInfo (other, DIA_Addon_Henry_Malcom))
	{
		AI_Output (self, other, "DIA_Addon_Henry_Owen_04_06"); //Leur camp de bûcherons se trouve non loin d'ici, près du vallon dans le sud-est.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Henry_Owen_04_07"); //Malcom m'avait prévenu que ça demanderait du temps - mais pas toute l'éternité !
	};
	
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_08"); //Dites-leur qu'on attend ce bois !
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_09"); //Non, attendez ! Allez le dire à Owen... Malcom n'est pas assez fiable.
	
	
	B_MalcomExident();
	
	MIS_Henry_HolOwen = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_HolOwen,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_HolOwen,"Henry attend le bois pour construire la palissade. Je dois en informer Owen. Je le trouverai près du vallon, avec Malcom.");  
};

// ------------------------------------------------------------
// 						Owen2 Report
// ------------------------------------------------------------
func void B_Addon_Henry_MalcomsDead()
{	
	AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_00"); //Et Malcom ?
	AI_Output (other, self, "DIA_Addon_Henry_Owen2_Add_15_01"); //Il est mort.
	AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_02"); //Eh bien, on dirait qu'il a manqué de chance, dans ce cas...
		
};
// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen2		(C_INFO)
{
	npc		 	= 	PIR_1354_Addon_Henry;
	nr		 	= 	33;
	condition	= 	DIA_Addon_Henry_Owen2_Condition;
	information	= 	DIA_Addon_Henry_Owen2_Info;
	permanent	= 	TRUE;
	description	= 	"A propos d'Owen le bûcheron...";
};
func int DIA_Addon_Henry_Owen2_Condition ()
{
	if (MIS_Henry_HolOwen == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Owen2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_00"); //A propos de ce bûcheron, Owen...
	
	if ((Npc_IsDead(PIR_1367_Addon_Owen)) == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_01"); //Il est mort.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_02"); //Malédiction ! Bon, je vais devoir envoyer de nouveaux hommes au camp de bûcherons, dans ce cas.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_03"); //(grogne) Il est grand temps que Morgan se décide enfin à éliminer les satanées bestioles qui rôdent dans le coin.
		B_Addon_Henry_MalcomsDead();
		//AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_01"); //Was? Er auch? Verdammte Mistviecher!
		MIS_Henry_HolOwen = LOG_OBSOLETE;
	
		B_LogEntry	(TOPIC_Addon_HolOwen,"Owen et Malcom sont tous les deux morts.");	
		Log_SetTopicStatus (TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	  
	}
	else if (Owen_ComesToHenry == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_03"); //Owen vous apportera le bois.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_04"); //Très bien. Il était temps, d'ailleurs.
		B_Addon_Henry_MalcomsDead();
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_05"); //Voici votre récompense.
		B_GiveInvItems (self, other, ItMi_Gold, 200);
		B_StartOtherRoutine	(PIR_1367_Addon_Owen,"PostStart");
		
		
		B_LogEntry	(TOPIC_Addon_HolOwen,"Owen apportera le bois à Henry.");
		
		MIS_Henry_HolOwen = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_06"); //Où se trouve son camp, au juste ?
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_07"); //Non loin d'ici, au sud-est du camp, près du vallon.
	};
};

// ************************************************************
// 		  						PERM
// ************************************************************
var int Henry_PERM_Once;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Palisade_CanHelp(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 34;
	condition	= DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information	= DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent	= TRUE;
	description	= "Avez-vous besoin d'aide ?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if (MIS_Henry_HolOwen == LOG_SUCCESS)
	|| (MIS_Henry_HolOwen == LOG_OBSOLETE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Palisade_CanHelp_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_CanHelp_15_00"); //Avez-vous besoin d'aide ?
	if (Henry_PERM_Once == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01"); //Savez-vous quelque chose de la construction de palissades ? 
		AI_Output (other,self ,"DIA_Addon_Henry_Palisade_CanHelp_15_02"); //Non, pas vraiment.
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03"); //Dans ce cas, vous ne me serez d'aucune utilité ici. Allez donc donner un coup de main à quelqu'un d'autre.
		Henry_PERM_Once = TRUE;
	};
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04"); //En ce qui me concerne, vous êtes libre de vous soûler jusqu'à l'inconscience, mais ne traînez pas dans les pattes de mes gars ! 
};



// ************************************************************
// 							Teach 2h
// ************************************************************
// ------------------------------------------------------------
// 		  					Wanna Learn
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_WhatTeach(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 21;
	condition	= DIA_Addon_Henry_WhatTeach_Condition;
	information	= DIA_Addon_Henry_WhatTeach_Info;
	permanent	= TRUE;
	description	= "Pouvez-vous m'apprendre à mieux me battre ?";
};                       
FUNC INT DIA_Addon_Henry_WhatTeach_Condition()
{
	if (Knows_HenrysEntertrupp == TRUE)
	&& (Henry_Addon_TeachPlayer == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Henry_WhatTeach_Info()
{	
	AI_Output (other, self, "DIA_Addon_Henry_WhatTeach_Add_15_00"); //Pouvez-vous m'apprendre à améliorer ma technique de combat ?
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_01"); //(rires) D'abord, versez votre droit d'entrée. Ensuite, nous parlerons de combat.
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_02"); //(sournois) Tout est inclus dans le prix.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_03"); //Bien sûr, pourquoi pas ?
		Henry_Addon_TeachPlayer = TRUE;
		
		Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
};

// ------------------------------------------------------------
// 		  					Teach 2h
// ------------------------------------------------------------
var int Henry_merke2h;
var int Henry_Labercount;
// ------------------------------------------------------------
func VOID B_Henry_CommentFightSkill ()
{
	if (Henry_Labercount == 0)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_01"); //Vous apprenez vite... Peut-être deviendrez-vous un vrai pirate, un jour !  
		Henry_Labercount = 1;
	}
	else if (Henry_Labercount == 1)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_02"); //Si vous continuez ainsi, vous serez bientôt capable d'aborder un navire à vous seul !
		Henry_Labercount = 2;
	}
	else if (Henry_Labercount == 2)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_03"); //N'oubliez pas - qui pare vivra ! 
		Henry_Labercount = 0;
	};
};
// ------------------------------------------------------------
instance DIA_Addon_Henry_Teach(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 6;
	condition	= DIA_Addon_Henry_Teach_Condition;
	information	= DIA_Addon_Henry_Teach_Info;
	permanent	= TRUE;
	description	= "Apprenez- moi !";
};                       
FUNC INT DIA_Addon_Henry_Teach_Condition()
{
	if (Henry_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Teach_15_00"); //Montrez-moi comment faire !
					
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];  
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};
FUNC VOID DIA_Addon_Henry_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_2H] > Henry_Merke2h)
	{
		B_Henry_CommentFightSkill ();
	}
	else if  (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Teach_Back_04_00"); //Vous devenez sacrément bon...
	};
	Info_ClearChoices (DIA_Addon_henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 75);
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_CB_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 75);
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};

func VOID DIA_Addon_Henry_Teach_2H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);

	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};
FUNC VOID DIA_Addon_Henry_Teach_2H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
		
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};



// ************************************************************
// 		  						Greg
// ************************************************************
INSTANCE DIA_Addon_Henry_Palisade_Train(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 11;
	condition	= DIA_Addon_Henry_Palisade_Train_Condition;
	information	= DIA_Addon_Henry_Palisade_Train_Info;
	permanent	= FALSE;
	description	= "Greg est votre chef ?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Train_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Palisade))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Train_15_00"); //Greg est votre chef ?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_01"); //Pour sûr. Et c'est le Capitaine Greg, pour vous. C'est bien clair ?   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_02"); //C'est un sacré bonhomme. Si vous le rencontrez, faites en sorte de ne pas vous le mettre à dos. Vous ne vivriez pas assez longtemps pour le regretter. 
	
	if (PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Train_15_03"); //Je l'ai déjà rencontré.
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_04"); //Tant mieux, alors ! Vous savez donc ce que je veux dire...   
	};

	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_05"); //Il n'est pas au camp, en ce moment.  
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_06"); //Francis est aux commandes, pour l'instant.   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_07"); //Il reste assis toute la journée devant la cabane de Greg et nous regarde travailler. 
};

// ************************************************************
// 		  				Dein eigener Entertrupp
// ************************************************************
INSTANCE DIA_Addon_Henry_YourOwnTrupp (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 1;
	condition	= DIA_Addon_Henry_YourOwnTrupp_Condition;
	information	= DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_YourOwnTrupp_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Henry_Add_04_04"); //Le capitaine vous a confié votre propre troupe de pillage, je vois !
	AI_Output (self ,other,"DIA_Addon_Henry_Add_04_05"); //Alors faites en sorte que vos gars ne s'ennuient pas !
	AI_StopProcessInfos (self);
};



/*
AI_Output (other,self ,"DIA_Addon_Henry_HenrysCrew_15_00"); //Wer gehört zu deinem Trupp?
AI_Output (other,self ,"DIA_Addon_Henry_Morgan_15_00"); //Wo finde ich Morgan?
*/
