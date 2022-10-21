


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenOW_EXIT(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 999;
	condition	= DIA_MiltenOW_EXIT_Condition;
	information	= DIA_MiltenOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_MiltenOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  		Hallo
// ************************************************************

INSTANCE DIA_MiltenOW_Hello (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= TRUE;
	condition	= DIA_MiltenOW_Hello_Condition;
	information	= DIA_MiltenOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_MiltenOW_Hello_Condition()
{
		return TRUE;
};
FUNC VOID DIA_MiltenOW_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//Eh bien, qui voilà ? Notre héros de la Barrière !
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Heureux de vous voir Milten.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"Est-ce que je vous connais ?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //Vous souvenez-vous de Gorn, Diego et Lester ?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//Heureux de vous revoir, Milten. Mais dites-moi... Etes-vous resté ici ou êtes-vous revenu?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Je suis revenu. Après la destruction de la Barrière, je suis entré au monastère des Magiciens du feu.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Mais quand il s'est avéré que les paladins voulaient venir ici, mon expérience et ma connaissance des lieux se sont avérées très utiles.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Ils ont donc décidé de me confier la mission sacrée de leur fournir le soutien magique nécessaire lors de cette expédition.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Bien sûr que je me rappelle des gars.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ces noms ne me disent rien du tout.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//Non, pourquoi ? Suis-je censé les connaître ?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Vous avez dû endurer beaucoup de choses, à ce que je vois...
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Alors, qu'avez-vous à signaler ?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ces noms ne me disent rien du tout.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Bien sûr que je me souviens d'eux !
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//Eh bien, Gorn et Diego ne sont pas allés bien loin. Ils ont été attrapés dans la vallée par les paladins.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Par contre Lester a disparu et je n'ai aucune idée de l'endroit où il peut se cacher.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//J'ai croisé Lester. Il est avec Xardas maintenant.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Ah, enfin une bonne nouvelle !
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//Moi, je n'ai rien de plaisant à vous apprendre.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Ces noms ne me disent rien.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Vous avez tout oublié ? Dans ce cas, laissons le passé où il est et concentrons-nous plutôt sur le présent.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//Même si, hélas, je n'ai rien de plaisant à vous apprendre...
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
// ************************************************************
// 		Bericht	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Bericht(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 3;
	condition	= DIA_MiltenOW_Bericht_Condition;
	information	= DIA_MiltenOW_Bericht_Info;
	permanent	= FALSE;
	description = "Alors, qu'avez-vous à signaler ?";
};                       

FUNC INT DIA_MiltenOW_Bericht_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Bericht_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//Qu'avez-vous à m'apprendre ?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//Les paladins sont venus ici pour chercher le minerai magique.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Mais avec les attaques d'orques et de dragons, cela m'étonnerait fort qu'ils repartent avec le minerai.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//Non, par Innos ! Je sens la présence de quelque chose de mystérieux et de malfaisant, qui ne cesse de croître et qui émane de cette vallée.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Nous avons payé un prix terrible pour la défaite du Dormeur. La destruction de la Barrière a dévasté la région.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Nous aurons de la chance si nous survivons à tout cela.
};
// ************************************************************
// 		Erz		  
// ************************************************************
INSTANCE DIA_MiltenOW_Erz(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 4;
	condition	= DIA_MiltenOW_Erz_Condition;
	information	= DIA_MiltenOW_Erz_Info;
	permanent	= FALSE;
	description = "Quelle quantité de minerai avez-vous amassée pour l'instant ?";
};                       

FUNC INT DIA_MiltenOW_Erz_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Bericht)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Erz_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Quelle quantité de minerai avez-vous stockée jusque-là ?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Combien de minerai ? Pas un coffre ! Cela fait une éternité que nous n'avons plus le moindre contact avec les mineurs.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//Cela ne m'étonnerait pas qu'ils soient tous morts depuis longtemps. Et voilà que nous sommes attaqués par des dragons et assiégés par les orques !
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Cette expédition est un véritable désastre !
	
};
/*	
	Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schläfertempel gegangen bist.
*/
// ************************************************************
// 		Wo sind Gorn und Diego?	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Wo(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Wo_Condition;
	information	= DIA_MiltenOW_Wo_Info;
	permanent	= FALSE;
	description = "Où sont Gorn et Diego ?";
};                       

FUNC INT DIA_MiltenOW_Wo_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	&& (Knows_Diego == TRUE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Wo_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Où sont Gorn et Diego actuellement ?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Eh bien, Gorn est ici, au cachot, pour avoir résisté lors de son interpellation.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Quant à Diego, il a été assigné à un groupe de mineurs. Demandez à Parcival, le paladin. C'est lui qui a déterminé les groupes.
	
	KnowsAboutGorn = TRUE; 
	SearchForDiego = LOG_RUNNING; 
};
// ************************************************************
// 		Gorn befreien			  
// ************************************************************
INSTANCE DIA_MiltenOW_Gorn(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Gorn_Condition;
	information	= DIA_MiltenOW_Gorn_Info;
	permanent	= FALSE;
	description = "Allons libérer Gorn !";
};                       

FUNC INT DIA_MiltenOW_Gorn_Condition()
{	
	if (KnowsAboutGorn == TRUE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Gorn_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//Allons libérer Gorn !
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//Le problème, c'est qu'il est accusé d'un crime.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Mais avec un peu de chance, Garond acceptera peut-être de passer un marché avec nous et nous pourrons alors racheter sa liberté.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Peut-être, oui...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Tenez-moi au courant.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Le commandant Garond a fait emprisonner Gorn. Peut-être acceptera-t-il un accord pour le libérer.");
};
// ************************************************************
// 		Garond will tausend Goldstücke			  
// ************************************************************
INSTANCE DIA_MiltenOW_Preis(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Preis_Condition;
	information	= DIA_MiltenOW_Preis_Info;
	permanent	= FALSE;
	description = "Garond veut 1 000 pièces d'or pour Gorn.";
};                       

FUNC INT DIA_MiltenOW_Preis_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Preis_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond exige 1 000 pièces d'or en échange de la libération de Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//C'est une coquette somme. Je peux mettre 250 pièces d'or.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten m'a donné 250 pièces d'or pour payer la libération de Gorn.");

};
// ************************************************************
// 		Nicht genug Gold  
// ************************************************************
INSTANCE DIA_MiltenOW_Mehr(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Mehr_Condition;
	information	= DIA_MiltenOW_Mehr_Info;
	permanent	= FALSE;
	description = "J'ai besoin d'or pour acheter la liberté de Gorn.";
};                       

FUNC INT DIA_MiltenOW_Mehr_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Npc_HasItems (other, ItMi_Gold) < 1000) 
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Preis) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Mehr_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//Il me faut davantage d'argent pour pouvoir racheter la liberté de Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//Obtenir de l'argent... hmm... c'est la spécialité de Diego, mais il n'est pas là.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Peut-être Gorn en a-t-il caché quelque part ? Il serait bon de se renseigner.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Je vais lui écrire une note. Essayez de faire en sorte qu'il la reçoive.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten m'a remis un message de Gorn. Si je peux m'infiltrer dans la prison, il pourra me dire s'il a de l'or caché quelque part.");
};
// ************************************************************
// 		Ausrüstung				  
// ************************************************************
INSTANCE DIA_MiltenOW_Equipment(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Equipment_Condition;
	information	= DIA_MiltenOW_Equipment_Info;
	permanent	= FALSE;
	description = "Pouvez-vous me donner de l'équipement.";
};                       

FUNC INT DIA_MiltenOW_Equipment_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Garond_Equipment)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Equipment_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Pouvez-vous me fournir un équipement ? Garond m'a demandé de me rendre aux sites miniers.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//Et où voulez-vous que je le trouve ? Je n'ai qu'une seule chose de valeur à vous donner : une pierre runique.
	//AI_Output (self ,other,"DIA_MiltenOW_Equipmentt_03_02");//Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schlösser nicht öffnen.  
	
	B_GiveInvItems (self,other, ItMI_RuneBlank,1);
	//Schlüssel auf FP inserten
};	

//***********************
//	Gorns Versteck
//***********************

INSTANCE DIA_MiltenOW_Versteck (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 1;
	condition	= DIA_MiltenOW_Versteck_Condition;
	information	= DIA_MiltenOW_Versteck_Info;
	permanent	= FALSE;
	IMPORTANT 	= FALSE;
	description = "J'ai une réponse de Gorn..."; 
}; 

FUNC INT DIA_MiltenOW_Versteck_Condition()
{
	if (GornsTreasure == TRUE)
	&& (Npc_HasItems (other, ItMi_GornsTreasure_MIS ) <= 0)
	&& (Gorns_Beutel == FALSE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenOW_Versteck_Info()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //J'ai la réponse de Gorn. Il dit que l'or se trouve à la porte sud.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //(amer) L'ancienne porte sud, vous voulez dire. Le dragon l'a transformée en monceau de gravats.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Comment faire pour s'y rendre ?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //C'est à côté du bélier des orques. La porte sud se trouvait juste à droite.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //Ce ne sera pas simple. Restez discret et faites vite.
	
	B_LogEntry (TOPIC_RescueGorn,"L'ancienne porte sud est à droite du bélier orque. L'or de Gorn est quelque part par là.");
};
// ************************************************************
// 		Gorn ist frei		  
// ************************************************************
INSTANCE DIA_MiltenOW_Frei(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Frei_Condition;
	information	= DIA_MiltenOW_Frei_Info;
	permanent	= FALSE;
	description = "J'ai libéré Gorn.";
};                       

FUNC INT DIA_MiltenOW_Frei_Condition()
{	
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Frei_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//J'ai libéré Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Bien. Dans ce cas réfléchissons à ce qu'il nous faut faire maintenant.
};
// ************************************************************
// 		Lehren
// ************************************************************
INSTANCE DIA_MiltenOW_Lehren(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 9;
	condition	= DIA_MiltenOW_Lehren_Condition;
	information	= DIA_MiltenOW_Lehren_Info;
	permanent	= FALSE;
	description = "Pouvez-vous m'enseigner quelque chose ?";
};                       

FUNC INT DIA_MiltenOW_Lehren_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Lehren_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//Pouvez-vous m'apprendre quelque chose ?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Je peux vous apprendre à utiliser la magie du 2nd Cercle ou vous aider à augmenter votre puissance.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Si vous vous sentez prêt à augmenter votre pouvoir, je peux vous aider.
};	

// ************************************************************
// 		Teach zweiter Kreis
// ************************************************************
INSTANCE DIA_MiltenOW_TeachCircle2(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 91;
	condition	= DIA_MiltenOW_TeachCircle2_Condition;
	information	= DIA_MiltenOW_TeachCircle2_Info;
	permanent	= TRUE;
	description = "Apprenez-moi le second Cercle de magie.";
};                       

FUNC INT DIA_MiltenOW_TeachCircle2_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_MiltenOW_Lehren))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_TeachCircle2_Info()
{	
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //Enseignez-moi le 2nd Cercle de magie.
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //Ce privilège revient normalement aux maîtres de notre ordre.
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //Mais dans ce cas, je pense qu'il est possible de faire une exception.
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //Je ne sais pas si je me souviens des paroles exactes...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Entrez désormais dans le second cercle. Euh... il vous montrera la voie, mais ce sont vos actes qui la traceront... ou quelque chose de ce genre.
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //Enfin, vous comprenez.
	};
};


// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenOW_Teach(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 90;
	condition	= DIA_MiltenOW_Teach_Condition;
	information	= DIA_MiltenOW_Teach_Info;
	permanent	= TRUE;
	description = "Je veux apprendre de nouveaux sorts.";
};                       

FUNC INT DIA_MiltenOW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Je souhaiterais apprendre de nouveaux sorts.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenOW_Teach);
		Info_AddChoice (DIA_MiltenOW_Teach,DIALOG_BACK,DIA_MiltenOW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenOW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenOW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenOW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Vous n'avez pas encore atteint le 2nd Cercle de magie. Je ne peux rien vous enseigner.
	};
};	
FUNC VOID DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_Teach);
};
FUNC VOID DIA_MiltenOW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenOW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_OW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenOW_Mana_Condition;
	information	 = 	DIA_MiltenOW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux augmenter mon pouvoir magique.";
};
func int DIA_MiltenOW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_MiltenOW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Je veux augmenter mon pouvoir magique.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Votre puissance magique est trop grande pour que je puisse vous aider à l'augmenter.
	};
	Info_ClearChoices (DIA_MiltenOW_Mana);
};
func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
	
};
func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
// ************************************************************
// 		Perm
// ************************************************************
INSTANCE DIA_MiltenOW_Perm(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Perm_Condition;
	information	= DIA_MiltenOW_Perm_Info;
	permanent	= TRUE;
	description = "Quel est votre travail ici ?";
};                       
FUNC INT DIA_MiltenOW_Perm_Condition()
{	
	if (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_MiltenOW_Frei) == FALSE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Quel est votre rôle, ici ?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//A l'origine, j'étais censé me livrer à des tests sur le minerai magique, mais nous n'en avons pas assez.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Alors, je me concentre sur l'étude de l'alchimie.
};
// ************************************************************
// 		Perm 2
// ************************************************************
INSTANCE DIA_MiltenOW_Plan(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Plan_Condition;
	information	= DIA_MiltenOW_Plan_Info;
	permanent	= TRUE;
	description = "Que comptez-vous faire ?";
};                       
FUNC INT DIA_MiltenOW_Plan_Condition()
{	
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Frei) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Plan_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Que comptez-vous faire ?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Je reviendrai. Je vais attendre encore un peu mais, maintenant que Gorn est libre, nous pouvons partir tous les deux.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Il est plus que nécessaire que Pyrokar apprenne quelle est la situation, ici.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Si vous le pensez.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//J'espère que le seigneur Hagen prendra conscience de la menace qui plane sur cette vallée. Je n'ose imaginer ce qui se produira si les orques parviennent à franchir le col.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//Dans ce cas, bon voyage.
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MiltenOW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 888;
	condition	= DIA_MiltenOW_PICKPOCKET_Condition;
	information	= DIA_MiltenOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Il serait difficile de voler sa potion)";
};                       

FUNC INT DIA_MiltenOW_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_MiltenOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MiltenOW_PICKPOCKET);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_BACK 		,DIA_MiltenOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MiltenOW_PICKPOCKET_DoIt);
};

func void DIA_MiltenOW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItPo_Perm_Mana,1);
		B_GiveInvItems (self, other, ItPo_Perm_Mana, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_MiltenOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
};



