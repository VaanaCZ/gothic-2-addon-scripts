
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Canthar_PICKPOCKET (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 900;
	condition	= DIA_Canthar_PICKPOCKET_Condition;
	information	= DIA_Canthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Canthar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 25);
};
 
FUNC VOID DIA_Canthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Canthar_PICKPOCKET);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_BACK 		,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};
	
func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Canthar_EXIT(C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 999;
	condition	= DIA_Canthar_EXIT_Condition;
	information	= DIA_Canthar_EXIT_Info;
	permanent	= TRUE;
	description = "Je dois y aller !";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //Il faut que j'y aille�!
	AI_Output (self, other,"DIA_Canthar_EXIT_09_01"); //Comme vous voulez...
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  			Personal CRIMES
// ************************************************************

INSTANCE DIA_Canthar_PersonalCRIMES (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_PersonalCRIMES_Condition;
	information	= DIA_Canthar_PersonalCRIMES_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

func INT DIA_Canthar_PersonalCRIMES_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Canthar_PersonalCRIMES_Info()
{	
	// ------ Spieler hat mich besiegt ------
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //Vous avez �t� stupide de m'attaquer.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(moqueur) Pensiez-vous vraiment pouvoir me vaincre aussi facilement�?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //Faites-vous pardonner ou je vous promets que vous allez le regretter�!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //A quoi pensez-vous au juste�?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Je n'ai pas cette somme !"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Voici votre or, oublions cette affaire !",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Voici votre argent. N'en parlons plus d'accord�?
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //Voil� qui est tr�s raisonnable de votre part.
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //Mais je n'ai pas autant d'argent�!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //Alors, pourquoi me faites-vous perdre mon temps�?
	
	AI_StopProcessInfos(self);
};


// ************************************************************
// 			  				 Hallo 
// ************************************************************

INSTANCE DIA_Canthar_Hallo (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_Hallo_Condition;
	information	= DIA_Canthar_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Canthar_Hallo_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_Hallo_Info()
{	
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	// ------ OHNE R�stung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //Eh bien, eh bien... qui avons-nous l�?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Vous vous rendez en ville, n'est-ce pas�?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Peut-�tre.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Hmm... (d�daigneux) Vous avez une t�te de fugitif, et tous les fugitifs se rendent en ville.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Vous pourriez m�me �tre un ancien d�tenu de la colonie mini�re.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(rapidement) Je me moque d'o� vous venez, mais je pense avoir une offre int�ressante � vous faire...
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//Alors�? Le travail avance bien, paysan�?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "Ai-je l'air d'un paysan ?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "Je ne peux pas me plaindre."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen R�stungen (h�chst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //Que puis-je pour vous ?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//Je ne peux pas me plaindre.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//Je peux faire quelque chose pour vous�?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //Ai-je l'air d'un fermier�?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //Oui, compl�tement. Par contre, votre fa�on de parler est diff�rente.
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //(pensif) Si je ne me trompe pas � votre sujet, je pense avoir une offre int�ressante � vous faire...
	
	Canthar_GotMe = TRUE;
	
	Info_ClearChoices	(DIA_Canthar_Hallo);
};


// ************************************************************
// 		  				 	WhatOffer				//E3
// ************************************************************

INSTANCE DIA_Canthar_WhatOffer (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_WhatOffer_Condition;
	information	= DIA_Canthar_WhatOffer_Info;
	permanent	= FALSE;
	description	= "Qu'avez-vous � m'offrir ?";
};                       

FUNC INT DIA_Canthar_WhatOffer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_WhatOffer_Info()
{	
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //Qu'avez-vous � offrir�?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Vu l'allure que vous avez, les gardes de la ville ne vous laisseront jamais entrer.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(ironique) Si vous vous montrez aussi 'convaincant' avec les gardes que vous l'�tes avec moi, ils ne vous laisseront jamais entrer en ville.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //Je peux vous aider � entrer en ville.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //J'ai ici un bout de papier frapp� du sceau royal et de la signature du gouverneur. C'est ce qu'on appelle un laissez-passer.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //Si vous avez ce papier sur vous, les gardes vous laisseront aller et venir � votre guise, m�me si vous �tes v�tu de haillons.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //�a vous int�resse�?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Non ! Gardez votre papier !",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Que voulez-vous en �change du laissez-passer ?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Comment allez-vous entrer en ville ?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Il doit y avoir une entourloupe l�-dessous..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Je suis un marchand itin�rant. Je vends un peu de tout.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar vend toutes sortes d'armes."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //J'imagine qu'il y a un pi�ge...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //(faussement honn�te) Un pi�ge�? Mais non, voyons. Vous me devrez juste une faveur, c'est tout.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //Et vous, comment entrerez-vous en ville�?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Les gardes me connaissent. Il suffira que je leur dise que j'ai perdu mon laissez-passer.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //Que voulez-vous en �change de votre laissez-passer�?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(satisfait) Ahh... je savais que je vous avais bien jug�!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Ecoutez... je vais vous remettre mon laissez-passer sans rien vous demander en �change.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //C'est vrai�?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Oui, oui. Par contre, si nous nous retrouvons en ville, vous me devrez une faveur.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //Alors�? C'est d'accord�?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Bien s�r, donnez-moi le papier.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Oui. Donnez-moi votre laissez-passer.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Tenez. Prenez-en soin surtout ! Il a une grande valeur.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Une derni�re chose�: ne songez m�me pas � reprendre votre parole�!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //En tant que marchand, je b�n�ficie d'une influence plus que cons�quente en ville, et je saurais vous le faire payer.
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"J'ai obtenu un laissez-passer aupr�s du marchand Canthar pour entrer en ville. En �change, je lui devrai un service la prochaine fois que nous nous rencontrerons.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //Non. Gardez votre laissez-passer.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Hmm... on dirait que je vous ai finalement mal jug�...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //Tant pis. Peut-�tre voudrez-vous autre chose... Cela vous int�resserait-il de voir ce que j'ai � offrir�?
	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
};


// ************************************************************
// 		  				 	TRADE				
// ************************************************************

instance DIA_Canthar_TRADE		(C_INFO)
{
	npc		 	= Vlk_468_Canthar;
	nr 			= 888;
	condition	= DIA_Canthar_TRADE_Condition;
	information	= DIA_Canthar_TRADE_Info;
	permanent	= TRUE;
	description	= "Montrez-moi vos marchandises !";
	trade		= TRUE;
};

func int DIA_Canthar_TRADE_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //Montrez-moi vos marchandises !
	
	B_GiveTradeInv (self);
	
	AI_Output (self, other, "DIA_Canthar_TRADE_09_01"); //Faites votre choix.
	
	
};



// ###########################################
// ###########################################

// 				In der Stadt 

// ###########################################
// ###########################################
/*
		-->
		Aber ein H�ndler namnes Canthar hat das erz�hlt. 
	*/

///////////////////////////////////////////////////////////////////////
//	Info PayPriceInCity
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_PAYPRICEINCITY		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_PAYPRICEINCITY_Condition;
	information	 = 	DIA_Canthar_PAYPRICEINCITY_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};

func int DIA_Canthar_PAYPRICEINCITY_Condition ()
{
	if (Canthar_InStadt == TRUE)
	&& (Npc_IsDead(Sarah) == FALSE) 
	&& (Canthar_GotMe == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_PAYPRICEINCITY_Info ()
{
	if (Canthar_Gefallen == TRUE)
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //Vous me devez toujours une faveur et l'heure est venue de payer votre dette.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //H�, vous�! J'ai une proposition � vous faire.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //Que voulez-vous ?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Je veux r�cup�rer mon emplacement de la place du march�. Sarah se l'est appropri�.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //Mais cela fait bien assez longtemps qu'elle occupe cet emplacement�! Je veux le r�cup�rer�!
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //En quoi est-ce que cela me concerne�?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //Je vais vous remettre une lettre qu'il faudra glisser dans sa poche.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Cela fait, allez trouver Andr� et dites-lui que Sarah vend des armes � Onar.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Elle est jet�e en prison, vous touchez une prime, et moi, je r�cup�re mon emplacement.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //Vous avez deux jours.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //Et qu'est-ce que j'ai � y gagner ?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Quand j'aurai r�cup�r� mon emplacement, je vous donnerai une arme... une TRES bonne arme.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Non, je ne veux rien avoir � faire avec �a.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Tr�s bien, je le ferai.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Que se passera-t-il si je refuse de faire �a ?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //Que se passera-t-il si je refuse�?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //Ce serait on ne peut plus stupide de votre part, car voyez-vous, je sais que vous �tes un prisonnier �vad�...
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Si jamais cela se sait, nul doute que vous vous retrouverez en d�licatesse avec les autorit�s.
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //Je ne veux rien avoir � faire avec cette histoire.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //Mauvais choix, petit. On se reverra !
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //On dirait que je n'ai pas le choix...
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Bravo, vous avez tout compris�! Voici la lettre.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //Comment suis-je cens� glisser la lettre dans sa poche sans qu'elle s'en aper�oive�?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Demandez-lui de vous montrer ses marchandises et passez � l'action quand elle le fera.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //Et n'oubliez surtout pas que je suis un homme influent. Je vous d�conseille fortement de me trahir.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar veut que je lui rende le service que je lui dois.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar m'a promis de me donner une arme si je lui rends un service.");
	};
	B_LogEntry (TOPIC_Canthar,"Je dois refiler une lettre � Sarah, qui sera la preuve qu'elle vend des armes � Onar. Puis je dois aller voir le seigneur Andr� et la d�noncer.");
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};
///////////////////////////////////////////////////////////////////////
//	Info SarahErledigt
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_SARAHERLEDIGT		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_SARAHERLEDIGT_Condition;
	information	 = 	DIA_Canthar_SARAHERLEDIGT_Info;
	permanent	 =	TRUE;
	description	 = 	"Au sujet de Sarah...";
};
func int DIA_Canthar_SARAHERLEDIGT_Condition ()
{
	if 	(MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Canthar_SARAHERLEDIGT_Info ()
{
	if ((Npc_IsDead(Sarah)) == FALSE)
	{
		if (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay()+ 2))
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //Vous n'avez pas une mission � accomplir�?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Glissez la lettre dans la poche de Sarah et allez la d�noncer aupr�s d'Andr�.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Faites-le... et n'essayez surtout pas de me trahir ou vous le regretteriez.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Vous prenez vraiment tout votre temps, vous�! Mettez-vous un peu au travail�!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sarah est morte.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //C'est vrai�? Merveilleux�! Dans ce cas, vous avez rempli votre part du march�.
			
			MIS_Canthars_KomproBrief = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
			Npc_ExchangeRoutine	(self,"MARKTSTAND"); 
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Success		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Success_Condition;
	information	 = 	DIA_Canthar_Success_Info;
	permanent	 =  FALSE;
	description	 = "Au sujet de Sarah...";
};
func int DIA_Canthar_Success_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)
	&& ((Npc_IsDead(Sarah)) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Success_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Bien jou�. C'est tout ce qu'elle m�ritait.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //Je me suis appropri� sa marchandise, alors, s'il vous faut une arme, n'h�sitez pas � venir me trouver.
	
	if (Kapitel == 1)
	{
		CreateInvItems (self,ItMw_ShortSword3 , 1); 
		CreateInvItems (self,ItMw_ShortSword4 , 1);
		CreateInvItems (self,ItMw_ShortSword5 , 1);
		CreateInvItems (self,ItMw_Kriegshammer1, 1); 
		
		CreateInvItems (self, ItMw_1h_Vlk_Sword, 1); 
		CreateInvItems (self, ItMw_1h_Nov_Mace, 1); 
	};
	if (Kapitel == 2)
	{
		CreateInvItems (self,ItMw_Stabkeule , 1);
		CreateInvItems (self,ItMw_Steinbrecher, 1); 
		CreateInvItems (self,ItMw_Schwert2 , 1); 
		CreateInvItems (self,ItMw_Bartaxt , 1); 
	};
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //Vous m'avez dit que vous me donneriez une arme...
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //C'est exact. Tenez, celle-ci est un vrai petit bijou.
				
		B_GiveInvItems (self, other, ItMW_Schiffsaxt,1);
	};
	B_GivePlayerXP (XP_Canthars_KomproBrief);
};

//---------------------------------------------------------------------

				//Canthat hat seinen Marktstand OHNE Spieler Hilfe 

//---------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info Canthar hat den Stand 
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Again		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Again_Condition;
	information	 = 	DIA_Canthar_Again_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Canthar_Again_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Again_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Again_09_00"); //Oh, encore vous...
	
	if (MIS_Canthars_KomproBrief  == LOG_FAILED)
	{
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //Pourquoi n'�tes-vous pas en prison�?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //On m'a rel�ch�. Je vous l'avais dit, je suis un homme tr�s influent en ville.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //Et j'en ai profit� pour me charger moi-m�me de Sarah. Vous pouvez jeter la lettre que je vous avais remise.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //Il me semble que je vous avais pr�venu, non�? Vous auriez mieux fait de faire ce que je vous avais demand�....
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //Maintenant, tous les marchands savent que vous �tes un prisonnier �vad�.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //C'est regrettable. D�sormais, il ne vous sera plus possible d'obtenir ne serait-ce qu'un cro�ton de pain sur la place du march�.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Je pourrais bien �videmment arranger, cela... pour, disons...
	B_Say_Gold 	(self, other, Canthar_Gold);
	
	AI_StopProcessInfos (self);
	
};

///////////////////////////////////////////////////////////////////////
//	Info Canthar bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Pay		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_Pay_Condition;
	information	 = 	DIA_Canthar_Pay_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};

func int DIA_Canthar_Pay_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Canthar_Again)
	&& (Canthar_Sperre == TRUE)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Pay_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //Vous venez me payer�?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"Tr�s bien, je paierai...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"Je n'ai pas assez d'argent sur moi...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"C'est combien d�j� ?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //Tr�s bien, je vais payer. Vous ne me laissez pas le choix.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(sourit) Bien. Je vais faire en sorte que votre r�putation redevienne meilleure aupr�s des marchands.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //Je n'ai pas assez d'argent sur moi.
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Alors procurez-vous la somme n�cessaire.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //Combien cela va-t-il co�ter d�j� ?
	B_Say_Gold 	(self, other, Canthar_Gold);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Canthar im Knast
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_CANTHARANGEPISST		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_CANTHARANGEPISST_Condition;
	information	 = 	DIA_Canthar_CANTHARANGEPISST_Info;
	important	 = 	TRUE;
	permanent	 =  TRUE;
};
func int DIA_Canthar_CANTHARANGEPISST_Condition ()
{
	if (Canthar_Ausgeliefert == TRUE)  //SC hat Canthar bei Andre verpfiffen!
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	&& Npc_IsInState  (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_CANTHARANGEPISST_Info ()
{
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Je vous avais pr�venu, mais vous n'avez pas voulu m'�couter. Nous en reparlerons plus tard.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //Allez-vous en maintenant�! J'ai envie de me reposer.
	
	AI_StopProcessInfos (self);	
};
///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_MinenAnteil		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 = 	3;
	condition	 = 	DIA_Canthar_MinenAnteil_Condition;
	information	 = 	DIA_Canthar_MinenAnteil_Info;

	description	 = 	"Vous vendez des concessions ill�gales !";
};

func int DIA_Canthar_MinenAnteil_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
		{
				return TRUE;
		};
};

func void DIA_Canthar_MinenAnteil_Info ()
{
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //Vous vendez des concessions mini�res ill�gales�!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //Oui, et alors�? Si je ne le fais pas, quelqu'un d'autre le fera.
	B_GivePlayerXP (XP_Ambient);
};











