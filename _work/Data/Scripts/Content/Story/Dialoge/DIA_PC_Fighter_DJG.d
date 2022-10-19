
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_GornDJG_EXIT(C_INFO)
{
	npc		= PC_Fighter_DJG;
	nr		= 999;
	condition	= DIA_GornDJG_EXIT_Condition;
	information	= DIA_GornDJG_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_GornDJG_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_STARTCAMP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_STARTCAMP_Condition;
	information	 = 	DIA_GornDJG_STARTCAMP_Info;

	description	 = 	"Je vois que vous avez rejoint les chasseurs de dragons.";
};

func int DIA_GornDJG_STARTCAMP_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_STARTCAMP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //Je vois que vous avez rejoint les chasseurs de dragons...
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //J'ai suivi Sylvio jusqu'� la Vall�e des mines, car je connais mieux la r�gion que lui et je voulais me faire ma propre id�e sur la situation.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //Je vais vous dire... quelque chose se mijote par ici. Je n�ai jamais vu autant d�orques au m�me endroit.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //Je ne serais pas �tonn� que Garond et les paladins aient abandonn� le ch�teau ou qu�ils se soient tous fait massacrer.

	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "On se verra plus tard.", DIA_GornDJG_STARTCAMP_By );
	Info_AddChoice	(DIA_GornDJG_STARTCAMP, "Que comptez-vous faire maintenant ?", DIA_GornDJG_STARTCAMP_Wohin );


};
func void DIA_GornDJG_STARTCAMP_Wohin ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //Que comptez-vous faire maintenant ?
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //Je vais d'abord suivre nos hommes jusqu'� la Vall�e des mines, et ensuite je partirai seul.
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //Il faut vraiment que je d�couvre ce que mijotent les orques.

};

func void DIA_GornDJG_STARTCAMP_By ()
{
	AI_Output			(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //A la revoyure !
	AI_Output			(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //Prenez bien soin de vous.
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HALLO		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HALLO_Condition;
	information	 = 	DIA_GornDJG_HALLO_Info;

	description	 = 	"Ainsi c'est ici que vous vous terrez !";
};

func int DIA_GornDJG_HALLO_Condition ()
{
	if (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1500) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HALLO_15_00"); //C�est donc l� que vous vous �tes terr� !
	AI_Output			(self, other, "DIA_GornDJG_HALLO_12_01"); //Vous non plus vous n��tes pas facile � tuer apparemment, hein ?

};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATSUP_Condition;
	information	 = 	DIA_GornDJG_WHATSUP_Info;

	description	 = 	"Avez-vous d�j� attrap� quelque chose ?";
};

func int DIA_GornDJG_WHATSUP_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATSUP_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_15_00"); //Est-ce que vous avez attrap� quoi que ce soit ?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_12_01"); //J�attends encore. Je crois qu�il y a quelque chose l�-haut, dans les vieilles ruines. On y voit des lumi�res � la nuit tomb�e et j�ai entendu des cris...

	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Peut-�tre Lester ?", DIA_GornDJG_WHATSUP_Lester );
	Info_AddChoice		(DIA_GornDJG_WHATSUP, "Un dragon ?", DIA_GornDJG_WHATSUP_A_Dragon );
	
	B_LogEntry (TOPIC_Dragonhunter,"Gorn se tient sur la haute plaine, au pied de la vieille forteresse de pierre. Ainsi il peut surveiller la haute plaine et la barri�re orque."); 
};
func void DIA_GornDJG_WHATSUP_Lester ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //C�est peut-�tre Lester qui est retourn� chez lui...
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //Que je sache, il n�habite plus l�.
};

func void DIA_GornDJG_WHATSUP_A_Dragon ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //Un dragon, alors ?
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //Tr�s certainement, oui. La plaine est aussi bien d�fendue que la salle au tr�sor du roi. Le probl�me, c�est que c�est le seul moyen d�acc�der � la forteresse.
	AI_Output			(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //Comme si les dragons ne suffisaient pas... On dirait qu�ils ont �galement des monstres sous leurs ordres.

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry (TOPIC_Dragonhunter,"Selon Gorn, il y a un dragon dans la vieille forteresse de pierre."); 
	
	Info_ClearChoices	(DIA_GornDJG_WHATSUP);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatMonsters
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATMONSTERS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WHATMONSTERS_Condition;
	information	 = 	DIA_GornDJG_WHATMONSTERS_Info;

	description	 = 	"De quel genre de monstres peut-il s'agir ?";
};

func int DIA_GornDJG_WHATMONSTERS_Condition ()
{
	if (GornDJG_WhatMonsters == TRUE)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WHATMONSTERS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //De quel genre de monstres peut-il bien s�agir ?
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //Je n�ai pas r�ussi � les distinguer, mais ce sont des bip�des � la peau �cailleuse. Et ils se d�placent comme des draco-saurinides ayant senti une proie...
	AI_Output			(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //Je les ai clairement entendus grogner et se d�placer. C�est � croire qu�ils se sont rendus ma�tres de la totalit� de la plaine.

};


///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_WAHTABOUTORCS_Condition;
	information	 = 	DIA_GornDJG_WAHTABOUTORCS_Info;

	description	 = 	"Et en ce qui concerne les orques ?";
};

func int DIA_GornDJG_WAHTABOUTORCS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //Et les orques ?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //Cela fait quelque temps que je les observe. La barricade qu�ils ont �rig�e doit cacher quelque chose. A mon avis, ils sont d�j� un grand nombre de l�autre c�t�.
	AI_Output			(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //Vous voulez dire, encore plus que tous ceux qu�on voit ?
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //�a ne me surprendrait pas qu�ils abattent leur palissade un soir pour se d�verser sur la r�gion. J�ai un mauvais pressentiment...
	AI_Output			(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //Si cela se produit, il faudra que je retourne pr�venir Lee. De toute fa�on, il veut quitter l��le. Et il sera plus que temps � ce moment-l�...

};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information	 = 	DIA_GornDJG_HELPKILLDRACONIANS_Info;

	description	 = 	"Pouvez-vous m'aider � p�n�trer dans la forteresse ?";
};

func int DIA_GornDJG_HELPKILLDRACONIANS_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATMONSTERS))
		&& (Npc_KnowsInfo(other, DIA_GornDJG_WAHTABOUTORCS))
		&& ((Npc_IsDead(RockDragon))== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //Pouvez-vous m�aider � m�introduire dans la forteresse ?
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //Je ne sais pas vraiment. J�ai peur que les orques me sautent dessus d�s que je cesserai de les surveiller.
	AI_Output			(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //C�est de la parano�a !
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //D�sol�, je ne peux rien y faire. Je ne me pardonnerais jamais s�ils me prenaient par surprise, vous comprenez ? D�un autre c�t�...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //Bah ! Pourquoi suis-je l� apr�s tout, hein ? Chargeons et frayons-nous un passage jusqu�� la forteresse !
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //Un peu d�exercice ne me fera pas de mal. Et puis, j�ai bien envie d�aller voir ces �tranges bestioles d�un peu plus pr�s...
	AI_Output			(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //Pr�venez-moi quand vous serez pr�t.

	B_LogEntry (TOPIC_Dragonhunter,"Gorn veut m'aider � atteindre la forteresse de pierre dominant la haute plaine."); 

};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht�s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_LOSGEHTS_Condition;
	information	 = 	DIA_GornDJG_LOSGEHTS_Info;

	description	 = 	"A l'attaque !";
};

func int DIA_GornDJG_LOSGEHTS_Condition ()
{
if (Npc_KnowsInfo(other, DIA_GornDJG_HELPKILLDRACONIANS))
		{
				return TRUE;
		};
};

func void DIA_GornDJG_LOSGEHTS_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //A l�attaque !
	AI_Output			(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //Comme au bon vieux temps, hein ? Mais je vais vous dire : ce combat est le mien. Cette fois-ci, c�est moi qui passe le premier.

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"RunToRockRuinBridge"); 
};




///////////////////////////////////////////////////////////////////////
//	Info BisHierhin
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_BISHIERHIN		(C_INFO)
{
	npc		 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_BISHIERHIN_Condition;
	information	 = 	DIA_GornDJG_BISHIERHIN_Info;
	important	 = 	TRUE;
};

func int DIA_GornDJG_BISHIERHIN_Condition ()
{
	if (Npc_GetDistToWP(self,"LOCATION_19_01")<1000) 				
		{
			return TRUE;
		};
};

func void DIA_GornDJG_BISHIERHIN_Info ()
{
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //C��tait un jeu d�enfant. Il va falloir vous charger du reste, mon ami. Menez-leur la vie dure ! Moi, je retourne surveiller les orques.
	AI_Output			(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //�a marche. Je vous retrouve � mon retour.
	AI_Output			(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //J�esp�re bien !

	B_LogEntry (TOPIC_Dragonhunter,"Gorn est retourn� � son poste d'observation. Il veut continuer � surveiller les orques."); 

	B_GivePlayerXP (XP_GornDJGPlateauClear);
 	
 	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD		(C_INFO)
{
	npc		 	 = 	PC_Fighter_DJG;
	condition	 = 	DIA_GornDJG_DRAGONDEAD_Condition;
	information	 = 	DIA_GornDJG_DRAGONDEAD_Info;

	description	 = 	"Le dragon de pierre est mort !";	
};

func int DIA_GornDJG_DRAGONDEAD_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_GornDJG_WHATSUP))
		&& (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01")<1000)
		&&  ((Npc_IsDead(RockDragon))== TRUE)
		)
		{
				return TRUE;
		};
};

func void DIA_GornDJG_DRAGONDEAD_Info ()
{
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //Le dragon de pierre est mort !
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //Je n�entends plus aucun cri. Vous �tes entr� dans la forteresse ?
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //Oui.
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //Ha, ha, ha ! C�est bien ce que je pensais. L� o� vous passez, rien ne reste debout.
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //Que comptez-vous faire, maintenant ?
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //Je vais rester quelque temps dans le coin avant de retourner voir Lee. Peut-�tre nous retrouverons-nous l�-bas...
	AI_Output			(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //J�en ai vraiment marre de ce coin ! Il est grand temps de quitter ce pays !
	AI_Output			(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //A plus tard !
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DJG_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DJG;
	nr			= 900;
	condition	= DIA_Fighter_DJG_PICKPOCKET_Condition;
	information	= DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	C_Beklauen (10, 35);
};
 
FUNC VOID DIA_Fighter_DJG_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DJG_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};
	
func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DJG_PICKPOCKET);
};











