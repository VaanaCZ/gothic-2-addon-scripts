// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Torlof_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_EXIT_Condition;
	information	= DIA_Torlof_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Torlof_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Torlof_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				Hallo
// ************************************************************
instance DIA_Torlof_Hallo (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 1;
	condition	= DIA_Torlof_HALLO_Condition;
	information	= DIA_Torlof_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Torlof_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Torlof_Hallo_01_00"); //(bougon) Que me voulez-vous ?
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Torlof_WannaJoin (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 2;
	condition	= DIA_Torlof_WannaJoin_Condition;
	information	= DIA_Torlof_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "Je veux me joindre aux mercenaires !";
};

func int DIA_Torlof_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Torlof_WannaJoin_15_00"); //Je voudrais rejoindre les mercenaires.
	AI_Output (self, other, "DIA_Torlof_WannaJoin_01_01"); //Ah, bon ? Et qu'est-ce qui vous fait penser que je serai d'accord ?
};

// ************************************************************
// 			  				Probe
// ************************************************************
var int Torlof_Go;

instance DIA_Torlof_Probe (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 3;
	condition	= DIA_Torlof_Probe_Condition;
	information	= DIA_Torlof_Probe_Info;
	permanent 	= TRUE;
	description	= "Mettez-moi à l'épreuve !";
};

func int DIA_Torlof_Probe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Torlof_WannaJoin))
	&& (hero.guild == GIL_NONE)
	&& (Torlof_Go == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Probe_Info ()
{
	AI_Output (other, self, "DIA_Torlof_Probe_15_00"); //Mettez-moi à l'épreuve !
	AI_Output (self, other, "DIA_Torlof_Probe_01_01"); //C'est Lee qui vous envoie ?
	
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_02"); //Il a dit que vous m'aideriez.
		AI_Output (self, other, "DIA_Torlof_Probe_01_03"); //(soupire) Très bien. Voilà comment ça marche : vous devez remplir deux conditions avant d'être accepté parmi nous.
		AI_Output (self, other, "DIA_Torlof_Probe_01_04"); //Premièrement, vous devez montrer que vous êtes capable d'accomplir les tâches qu'on vous confiera en tant que mercenaire. Je m'en assurerai en vous mettant à l'épreuve.
		AI_Output (self, other, "DIA_Torlof_Probe_01_05"); //Et deuxièmement, vous devez gagner le respect des autres mercenaires.
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine	(self,"Start"); 
		
		Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
		B_LogEntry (TOPIC_BecomeSLD,"Pour être accepté comme mercenaire, je dois passer l'épreuve de Torlof et gagner le respect des autres mercenaires.");
	}
	else
	{
		AI_Output (other, self, "DIA_Torlof_Probe_15_06"); //Non.
		AI_Output (self, other, "DIA_Torlof_Probe_01_07"); //Alors pourquoi me faites-vous perdre mon temps ?
		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 			  				Respekt
// ************************************************************
instance DIA_Torlof_Respekt (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 4;
	condition	= DIA_Torlof_Respekt_Condition;
	information	= DIA_Torlof_Respekt_Info;
	permanent 	= FALSE;
	description	= "Comment puis-je gagner le respect des autres mercenaires ?";
};

func int DIA_Torlof_Respekt_Condition ()
{
	if (Torlof_Go == TRUE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Respekt_Info ()
{
	AI_Output (other, self, "DIA_Torlof_Respekt_15_00"); //Comment puis-je gagner le respect des autres ?
	AI_Output (self, other, "DIA_Torlof_Respekt_01_01"); //Pour la plupart d'entre eux, savoir que vous avez passé avec succès l'épreuve que je vous aurai imposée suffira.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_02"); //Mais il vous faudra trouver un autre moyen de convaincre les autres.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_03"); //Quelques-uns chercheront sans doute à profiter de la situation, mais il se peut que votre tête ne revienne pas à certains, tout simplement.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_04"); //Essayez de bien vous entendre avec autant de gars que possible. Si vous voyez que vous n'y arrivez pas, il vous reste une solution : le duel.
	AI_Output (self, other, "DIA_Torlof_Respekt_01_05"); //Si vous l'emportez, vous gagnerez le respect de presque tout le monde. Mais attention à ne pas tuer votre adversaire par accident, sans quoi vous aurez un sérieux problème.
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Si je veux que les autres mercenaires me respectent, je dois passer l'épreuve de Torlof. Ils seront également convaincus si je peux les battre en duel.");
	
};

// ************************************************************
// 			  				Duellregeln
// ************************************************************
instance DIA_Torlof_Duellregeln (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 5;
	condition	= DIA_Torlof_Duellregeln_Condition;
	information	= DIA_Torlof_Duellregeln_Info;
	permanent 	= FALSE;
	description	= "Quelles sont les règles d'un duel ?";
};

func int DIA_Torlof_Duellregeln_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Torlof_Respekt))
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Duellregeln_Info ()
{
	AI_Output (other, self, "DIA_Torlof_Duellregeln_15_00"); //Quelles sont les règles en vigueur au cours d'un duel ?
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_01"); //C'est très simple. Les deux adversaires doivent avoir sorti leurs armes avant que le premier coup ne soit porté.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_02"); //Si vous attaquez le type d'en face par surprise, ça ne compte pas.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_03"); //Il doit y avoir un défi oral, ou une insulte, bref, une raison de se battre.
	AI_Output (self, other, "DIA_Torlof_Duellregeln_01_04"); //Les autres hommes n'interfèrent jamais dans ce cas de figure, sauf si l'un des deux adversaires se fait tuer.
	
	B_LogEntry (TOPIC_SLDRespekt,"Les règles d'un duel : un duel doit être le résultat d'un défi pour que personne d'autre ne s'en mêle. Un duel n'est jamais à mort.");
};

// ************************************************************
// 			  				DeineStimme
// ************************************************************
instance DIA_Torlof_DeineStimme (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 6;
	condition	= DIA_Torlof_DeineStimme_Condition;
	information	= DIA_Torlof_DeineStimme_Info;
	permanent 	= FALSE;
	description	= "Et vous ? Voterez-vous pour moi ?";
};

func int DIA_Torlof_DeineStimme_Condition ()
{
	if (Torlof_Go == TRUE)
	&& (other.guild == GIL_NONE)
	&& (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DeineStimme_Info ()
{
	AI_Output (other, self, "DIA_Torlof_DeineStimme_15_00"); //Et vous ? Etes-vous de mon côté ?
	AI_Output (self, other, "DIA_Torlof_DeineStimme_01_01"); //Oui, si vous me faites la preuve que vous êtes capable d'assumer les devoirs d'un mercenaire.
};


// ************************************************************
// 			  					RUF
// ************************************************************
var int Points_Sld;

instance DIA_Torlof_RUF (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 7;
	condition	= DIA_Torlof_RUF_Condition;
	information	= DIA_Torlof_RUF_Info;
	permanent 	= TRUE;
	description	= "Quelle est ma réputation parmi les mercenaires ?";
};

func int DIA_Torlof_RUF_Condition ()
{
	if (Torlof_Go == TRUE)
	&& (Torlof_GenugStimmen == FALSE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_RUF_Info ()
{
	AI_Output (other, self, "DIA_Torlof_RUF_15_00"); //Où en est ma réputation auprès des mercenaires ?
	AI_Output (self, other, "DIA_Torlof_RUF_01_01"); //Voyons voir...
	
	Points_Sld = 0;
	
	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_02"); //Wolf dit ne rien avoir contre le fait que vous vous joigniez à nous.
		Points_Sld = Points_Sld + 1;
	};
	
	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_03"); //Jarvis vous trouve bien.
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_04"); //Jarvis n'est pas encore sûr que vous soyez quelqu'un de bien.
		AI_Output (self, other, "DIA_Torlof_RUF_01_05"); //Il ne veut plus voir personne se laisser embobiner par Sylvio. Moi non plus, d'ailleurs.
	};
	
	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_06"); //Cord pense que vous êtes suffisamment bon pour vous joindre à nous.
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_07"); //Cord trouve que vous devez apprendre à mieux manier les armes.
	};
	
	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Cipher_Paket == LOG_SUCCESS)
	|| 		(MIS_Cipher_BringWeed == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_08"); //Cipher m'a dit qu'il avait toujours eu la certitude que vous intégreriez notre groupe. Apparemment, quelque chose l'a rendu très heureux...
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_09"); //Cipher dit que vous lui devez une faveur et que vous savez de quoi il veut parler.
	};
	
	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_10"); //Rod tient juste à récupérer son épée.
	}
	else if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_11"); //Apparemment, vous avez convaincu Rod que vous étiez assez fort.
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; //### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_12"); //Rod trouve que vous êtes une femmelette.
	};
		
	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems (Sentenza, itmi_gold) >= 50)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_13"); //Sentenza est d'accord pour voter en votre faveur. Il m'a dit que vous vous étiez montré extrêmement raisonnable.
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_14"); //Sentenza refuse de voter pour vous. Il m'a chargé de vous rappeler que vous lui deviez encore 50 pièces d'or.
	};
	
	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_15"); //Raoul est contre vous. J'ai l'impression qu'il ne peut pas vous supporter.
	};
	
	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_16"); //Inutile de dire quoi que ce soit au sujet de Sylvio et de Bullco. Ces deux débiles sont contre tout le monde.
	};
	
	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_17"); //Buster m'a dit que vous lui conveniez.
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_18"); //Même s'il vous a battu.
		};
		//### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_19"); //Buster m'a dit que vous vous étiez défilé quand il vous a défié.
		AI_Output (self, other, "DIA_Torlof_RUF_01_20"); //Ce n'était pas une bonne idée. Peut-être feriez-vous bien de retourner à l'avant-poste afin de le défier...
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_21"); //Et Dar trouve que vous êtes une grande gueule, mais sa voix n'a guère de poids ici.
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------
	
	if (Points_Sld > 0)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_22"); //Les autres mercenaires n'ont pas jugé bon de s'exprimer sur la question.
	};
	
	if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_23"); //La plupart d'entre eux attend de voir si vous réussissez l'épreuve.
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_24"); //Vous avez convaincu la plupart d'entre eux en passant l'épreuve avec succès.
		
		
		//ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Torlof_RUF_01_00"); //(sourit) Même si Cord y était un peu pour quelque chose...
			Points_Sld = Points_Sld + 4; 
		}
		//ADDON<
		
		
		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_25"); //Même s'ils sont beaucoup à penser que le fait d'obliger un fermier à payer son loyer était une épreuve bien trop facile.
			Points_Sld = Points_Sld + 3;
		}
		else //miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};
		AI_Output (self, other, "DIA_Torlof_RUF_01_26"); //Quoi qu'il en soit, ma voix vous est acquise.
		Points_Sld = Points_Sld + 1;
	};
	
	// --------------------
	// ------ Duelle ------
	// --------------------
	if (Sld_Duelle_gewonnen >= 3)//geändert M.F.
	{
		Points_Sld = Points_Sld + 1;
		
		if (Points_Sld >= 9)//geändert M.F.
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_27"); //Et vous avez remporté plusieurs duels.
			AI_Output (self, other, "DIA_Torlof_RUF_01_28"); //Beaucoup de mercenaires respectent ce genre de chose.
		}
		else
		{
			AI_Output (self, other, "DIA_Torlof_RUF_01_29"); //Au moins, vous avez remporté quelques duels.
		};
	};
		
	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------
	
	if (Points_Sld >= 9) //geändert M.F.					//(Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 für Duell)
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_30"); //La plupart des mercenaires sont de votre côté. Selon eux, vous pouvez vous joindre à nous à tout moment.
		AI_Output (self, other, "DIA_Torlof_RUF_01_31"); //Allez voir Lee. Il vous expliquera tout ce que vous devez savoir.
		Torlof_GenugStimmen = TRUE;
		B_LogEntry (TOPIC_BecomeSLD,"J'ai gagné le respect des mercenaires. Je dois maintenant parler à Lee."); 
	}
	else if (Points_Sld >= 7) 
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_32"); //Ça fait beaucoup, mais ce n'est pas encore assez.
		AI_Output (self, other, "DIA_Torlof_RUF_01_33"); //Continuez de vous battre avec les hommes.
	}
	else // <7
	{
		AI_Output (self, other, "DIA_Torlof_RUF_01_34"); //Vous êtes loin d'en avoir terminé, petit. Si vous voulez être accepté, il va vous falloir faire le nécessaire pour que cela se produise.
	};
};

// ************************************************************
// 			  				Aufgaben
// ************************************************************

instance DIA_Torlof_Aufgaben (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 8;
	condition	= DIA_Torlof_Aufgaben_Condition;
	information	= DIA_Torlof_Aufgaben_Info;
	permanent 	= FALSE;
	description	= "Quels sont mes devoirs en tant que mercenaire ?";
};

func int DIA_Torlof_Aufgaben_Condition ()
{
	if (Torlof_Go == TRUE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_15_00"); //Quels sont mes devoirs en tant que mercenaire ?
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_01"); //Onar nous a engagés pour deux raisons : faire en sorte que la milice ne lui cherche pas de noises et faire régner l'ordre dans son exploitation.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_02"); //Ce qui inclut le ramassage des loyers que les petits fermiers refusent parfois de payer.
	AI_Output (self, other, "DIA_Torlof_Aufgaben_01_03"); //Alors, qu'en dites-vous ?
	
	Info_ClearChoices (DIA_Torlof_Aufgaben);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Laissez-moi encaisser le loyer !", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice (DIA_Torlof_Aufgaben, "Ne vous inquiétez pas, je vais m'occuper de la milice !", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_00"); //Bien. Ecoutez, cela fait plusieurs semaines que Sékob le fermier n'a pas payé son loyer à Onar.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_01"); //Onar veut qu'il crache 50 pièces d'or. Des questions ?
	AI_Output (other, self, "B_Torlof_HolPachtvonSekob_15_02"); //Où se trouve la ferme de Sékob ?
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_03"); //Au nord de la vallée. En partant d'ici, c'est à droite du grand carrefour.
	AI_Output (self, other, "B_Torlof_HolPachtvonSekob_01_04"); //Si vous éprouvez des difficultés à trouver votre chemin, demandez aux fermiers qui travaillent aux champs.
	
	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;
	
	CreateInvItems (sekob,ItMi_Gold,50);
	Log_CreateTopic (TOPIC_TorlofPacht,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofPacht,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofPacht,"Torlof m'a demandé de recouvrer le loyer du fermier Sékob. Il doit 50 pièces d'or.");
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //Bengar le fermier se plaint que la milice l'importune depuis quelque temps.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //Apparemment, il serait victime de pressions, sans doute afin de l'inciter à abandonner Onar.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //Allez à sa ferme et faites comprendre aux miliciens qu'ils n'ont rien à y faire. Des questions ?
	AI_Output (other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //Où se trouve la ferme de Bengar ?
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //Au sud-ouest de la vallée, vous verrez un grand escalier conduisant à une plaine surélevée. C'est là que se trouve la ferme de Bengar.
	AI_Output (self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //Si vous vous perdez, demandez votre chemin aux fermiers travaillant aux champs.
 	
 	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
 	Bengar.flags = 0;
 	Wld_InsertNpc	(Mil_335_Rumbold,	"FARM3"); 
	Wld_InsertNpc	(Mil_336_Rick,		"FARM3"); 
	B_InitNpcGlobals();
	
	Log_CreateTopic (TOPIC_TorlofMiliz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_TorlofMiliz,LOG_RUNNING);
	B_LogEntry (TOPIC_TorlofMiliz,"Torlof m'a ordonné de chasser la milice de la ferme de Bengar. Celle-ci se trouve sur les hautes plaines.");
};


func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //Laissez-moi aller récupérer le loyer.
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output (other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //Ne vous en faites pas, je m'occupe de la milice.
	B_Torlof_BengarMilizKlatschen();
	Torlof_Probe = Probe_Bengar;
	Info_ClearChoices (DIA_Torlof_Aufgaben);
};

// ************************************************************
// 			  			Sekob Success
// ************************************************************
var int Torlof_TheOtherMission_Day;
// ------------------------------------------------------------
func void B_Torlof_TheOtherMissionDay()
{
	if (Torlof_TheOtherMission_Day < (Wld_GetDay() - 1)) 
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_00"); //Il vous en a fallu du temps. Onar ne va pas être content.
		Torlof_TheOtherMission_TooLate = TRUE;
		
		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output (self, other, "DIA_Torlof_Add_01_00"); //Et il se moque royalement que les paladins de la Vallée des mines se fassent tailler en pièces.
		};
	}
		else
	{
		AI_Output (self, other, "B_Torlof_TheOtherMissionDay_01_01"); //Bien joué ! Quand j'aurai autre chose pour vous, je vous le ferai savoir.
	};
};
// ------------------------------------------------------------
instance DIA_Torlof_SekobSuccess (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 9;
	condition	= DIA_Torlof_SekobSuccess_Condition;
	information	= DIA_Torlof_SekobSuccess_Info;
	permanent 	= TRUE;
	description	= "J'ai récupéré le loyer de Sékob.";
};

func int DIA_Torlof_SekobSuccess_Condition ()
{
	if (MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)
	{
		if (Sekob.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (Npc_IsDead (Sekob))
		{
			return TRUE;
		};
	};
};

func void DIA_Torlof_SekobSuccess_Info ()
{
	AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_00"); //Je ramène le loyer de Sékob.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_01"); //Alors ? Il a payé de son plein gré ?
		if (Npc_IsDead (Sekob))
		{
			AI_Output (other, self, "DIA_Torlof_SekobTot_15_00"); //Eh bien, il a plutôt eu un accident mortel...
		}
		else
		{
			AI_Output (other, self, "DIA_Torlof_SekobSuccess_15_02"); //Il m'a d'abord fallu le convaincre.
		};
				
		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_03"); //Bien joué ! Vous avez passé votre épreuve avec succès. Voilà qui devrait convaincre la plupart des mercenaires que vous avez votre place parmi nous.
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP (XP_Torlof_SekobsKohlebekommen);				
		B_LogEntry (TOPIC_BecomeSLD,"Je me suis acquitté de la tâche confiée par Torlof."); 
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Torlof_SekobSuccess_01_04"); //Et alors ? Vous avez tout dépensé en boisson ? Amenez-moi l'argent, et que ça saute !
	};
};

// ************************************************************
// 			  			Bengar Success
// ************************************************************
instance DIA_Torlof_BengarSuccess (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 10;
	condition	= DIA_Torlof_BengarSuccess_Condition;
	information	= DIA_Torlof_BengarSuccess_Info;
	permanent 	= FALSE;
	description	= "Je me suis occupé du problème de Bengar avec la milice.";
};

func int DIA_Torlof_BengarSuccess_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_IsDead (Rumbold))
	&& (Npc_IsDead (Rick))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BengarSuccess_Info ()
{
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_00"); //Je me suis chargé du problème que la milice posait à Bengar.
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_01"); //Vous êtes-vous assuré que les miliciens ne reviendront pas chez lui dès demain ?
	AI_Output (other, self, "DIA_Torlof_BengarSuccess_15_02"); //Ça m'étonnerait qu'ils en soient capables...
	AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_03"); //Bien joué !
		
	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output (self, other, "DIA_Torlof_BengarSuccess_01_04"); //Vous avez passé votre épreuve avec succès. Si vous avez été capable de vous charger de la milice, la plupart de nos hommes devraient vous respecter.
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};
	
	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry (TOPIC_BecomeSLD,"Je me suis acquitté de la tâche confiée par Torlof."); 
	Torlof_ProbeBestanden = TRUE;
};


// ************************************************************
// 			  				Welcome
// ************************************************************
instance DIA_Torlof_Welcome (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 11;
	condition	= DIA_Torlof_Welcome_Condition;
	information	= DIA_Torlof_Welcome_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Torlof_Welcome_Condition ()
{
	if (other.guild == GIL_SLD)
	&& (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Welcome_Info ()
{
	AI_Output (self, other, "DIA_Torlof_Welcome_01_00"); //Bienvenue chez les mercenaires, petit !
	AI_Output (other, self, "DIA_Torlof_Welcome_15_01"); //Merci !
	AI_Output (self, other, "DIA_Torlof_Welcome_01_02"); //Dès que j'aurai quelque chose à vous faire faire, je vous le ferai savoir.
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

	var int Torlof_KnowsDragons;

	func void B_Torlof_Dragons()
	{
		AI_Output (self, other, "DIA_Torlof_Add_01_01"); //Où étiez-vous passé ?
		AI_Output (other, self, "DIA_Torlof_Add_15_02"); //J'étais dans la Vallée des mines. Il y a des dragons là-bas ! Les paladins dégustent sacrément !
		AI_Output (self, other, "DIA_Torlof_Add_01_03"); //Ainsi, les légendes reposent sur une part de réalité...
		AI_Output (self, other, "DIA_Torlof_Add_01_04"); //Voilà qui devrait intéresser Lee.
		Torlof_KnowsDragons = TRUE;
	};

instance DIA_Torlof_TheOtherMission (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 11;
	condition	= DIA_Torlof_TheOtherMission_Condition;
	information	= DIA_Torlof_TheOtherMission_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Torlof_TheOtherMission_Condition ()
{
	if (other.guild == GIL_SLD)
	&& (Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Torlof_TheOtherMission_Info ()
{
	if (Torlof_KnowsDragons == FALSE)
	&& (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE)
	{
		B_Torlof_Dragons();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_00"); //Vous avez bien fait de venir, j'ai une mission à vous confier.
	AI_Output (other, self, "DIA_Torlof_TheOtherMission_15_01"); //Qu'y a-t-il ?
		
	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else //Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};
	
	AI_Output (self, other, "DIA_Torlof_TheOtherMission_01_02"); //Et finissez-moi ça pour demain au plus tard !
	Torlof_TheOtherMission_Day = Wld_GetDay();
};

// ************************************************************
// 			  			Dragons
// ************************************************************
instance DIA_Torlof_Dragons (C_INFO)
{
	npc		 	= SLD_801_Torlof;
	nr		 	= 12;
	condition	= DIA_Torlof_Dragons_Condition;
	information	= DIA_Torlof_Dragons_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Torlof_Dragons_Condition ()
{
	if (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE)
	&& (Kapitel <= 3)
	&& (other.guild == GIL_SLD)
	&& (Torlof_KnowsDragons == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_Dragons_Info ()
{
	B_Torlof_Dragons();
};

//*******************************************
//	WhatCanYouTeach
//*******************************************

INSTANCE DIA_Torlof_WhatCanYouTeach(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 140;
	condition	= DIA_Torlof_WhatCanYouTeach_Condition;
	information	= DIA_Torlof_WhatCanYouTeach_Info;
	permanent	= FALSE;
	description = "Pouvez-vous m'aider à améliorer mes compétences ?";
};                       

FUNC INT DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Torlof_WhatCanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_WhatCanYouTeach_15_00"); //Pouvez-vous m'aider à améliorer mes compétences ?
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_01"); //Je pourrais vous montrer comment mieux utiliser votre force lors des combats au corps à corps.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_02"); //Beaucoup de guerriers sont faibles car leur technique est trop déficiente pour leur permettre d'utiliser pleinement leur force.
	AI_Output (self ,other,"DIA_Torlof_WhatCanYouTeach_01_03"); //Et c'est la même chose pour l'agilité et les armes à distance.

	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Torlof peut m'aider à améliorer ma dextérité et ma force.");
};

// *******************************************
//					Teach
// *******************************************

var int Torlof_Merke_STR;
var int Torlof_Merke_DEX;
// -------------------------------------------

INSTANCE DIA_Torlof_Teach(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 150;
	condition	= DIA_Torlof_Teach_Condition;
	information	= DIA_Torlof_Teach_Info;
	permanent	= TRUE;
	description = "Je veux améliorer mes compétences !";
};                       

FUNC INT DIA_Torlof_Teach_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Torlof_WhatCanYouTeach))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Torlof_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Torlof_Teach_15_00"); //Je voudrais améliorer mes compétences.
	if (other.guild == GIL_SLD) 
	|| (other.guild == GIL_DJG)
	|| (other.guild == GIL_NONE)
	{
		Torlof_Merke_STR = other.attribute[ATR_STRENGTH];
		Torlof_Merke_DEX = other.attribute[ATR_DEXTERITY];
		
		Info_ClearChoices (DIA_Torlof_Teach);
		Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
		Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
		Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
		Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
		Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
	}
	else
	{
		AI_Output (self ,other,"DIA_Torlof_Teach_01_01"); //J'ai dit que je pouvais vous aider, pas que j'y étais disposé.
		AI_Output (self ,other,"DIA_Torlof_Teach_01_02"); //Tant que vous ne serez pas des nôtres, trouvez-vous un autre instructeur.
	};
};

FUNC VOID DIA_Torlof_Teach_Back ()
{
	if (Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_Torlof_Teach_Back_01_00"); //Bien. Maintenant vous pourrez faire meilleur usage de vos compétences.
	};

	Info_ClearChoices (DIA_Torlof_Teach);
};

FUNC VOID DIA_Torlof_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices (DIA_Torlof_Teach);
	Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
};

FUNC VOID DIA_Torlof_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);

	Info_ClearChoices (DIA_Torlof_Teach);
	Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
};

FUNC VOID DIA_Torlof_Teach_DEX_1 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);	

	Info_ClearChoices (DIA_Torlof_Teach);
	Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
};

FUNC VOID DIA_Torlof_Teach_DEX_5 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);

	Info_ClearChoices (DIA_Torlof_Teach);
	Info_AddChoice		(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Torlof_Teach_DEX_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Torlof_Teach_DEX_5);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1		, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Torlof_Teach_STR_1);
	Info_AddChoice		(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Torlof_Teach_STR_5);
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Torlof_KAP3_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_KAP3_EXIT_Condition;
	information	= DIA_Torlof_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Torlof_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dementoren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_DEMENTOREN		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	30;
	condition	 = 	DIA_Torlof_DEMENTOREN_Condition;
	information	 = 	DIA_Torlof_DEMENTOREN_Info;

	description	 = 	"Avez-vous une tâche à me confier ?";
};

func int DIA_Torlof_DEMENTOREN_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Torlof_DEMENTOREN_Info ()
{
	AI_Output (other, self, "DIA_Torlof_DEMENTOREN_15_00"); //Avez-vous quelque chose à me faire faire ?
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_01"); //Vous avez vu ces types à capuchon noir qui rôdent dans le coin ? Je vais vous dire, ils me donnent la chair de poule.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_02"); //Quand j'étais en mer, j'ai vu des trucs étranges, mais ces types me flanquent vraiment la chair de poule.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_03"); //Ils sont partis en direction du camp de brigands des montagnes à l'extrémité sud de la vallée.
	AI_Output (self, other, "DIA_Torlof_DEMENTOREN_01_04"); //Ce serait peut-être une bonne idée d'aller là-bas afin d'en apprendre davantage à leur sujet... et de nous débarrasser d'eux.
	
	Wld_InsertNpc		(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");
	
	Log_CreateTopic (TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry (TOPIC_Torlof_Dmt,"Certains de ces types en capuchon noir seraient dans le campement des bandits des montagnes au sud de la vallée. Ils donnent des brûlures d'estomac à Torlof. Je dois régler ce problème pour lui."); 

	MIS_Torlof_Dmt = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info Dementoren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_DmtSuccess	(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	30;
	condition	 = 	DIA_Torlof_DmtSuccess_Condition;
	information	 = 	DIA_Torlof_DmtSuccess_Info;

	description	 = 	"Les hommes en robe noire dans les montagnes ne sont plus parmi nous.";
};

func int DIA_Torlof_DmtSuccess_Condition ()
{
	if (MIS_Torlof_Dmt == LOG_RUNNING) 
	&& (Npc_IsDead(CastlemineDMT))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DmtSuccess_Info ()
{
	AI_Output (other, self, "DIA_Torlof_DmtSuccess_15_00"); //Les hommes à capuchon noir ne nous gêneront plus.
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_01"); //Vous vous êtes chargé d'eux ? Bien joué !
	AI_Output (self, other, "DIA_Torlof_DmtSuccess_01_02"); //Je n'avais aucune confiance en eux. Ils nous auraient forcément causé des ennuis, un jour ou l'autre.
	
	MIS_Torlof_Dmt = LOG_SUCCESS;
	B_GivePlayerXP (XP_Torlof_DMT);
};




//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Torlof_KAP4_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_KAP4_EXIT_Condition;
	information	= DIA_Torlof_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Torlof_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WoistSylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_WOISTSYLVIO		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	40;
	condition	 = 	DIA_Torlof_WOISTSYLVIO_Condition;
	information	 = 	DIA_Torlof_WOISTSYLVIO_Info;

	description	 = 	"Des mercenaires sont partis ?";
};

func int DIA_Torlof_WOISTSYLVIO_Condition ()
{
	if ((MIS_ReadyforChapter4 == TRUE)	|| (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Torlof_WOISTSYLVIO_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //Certains mercenaires sont partis ?
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //Sylvio a franchi le col après avoir pris plusieurs hommes avec lui.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //On dit qu'il y aurait des dragons de l'autre côté. Quand Sylvio a entendu ça, il est devenu impossible à arrêter.
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //C'est vrai qu'un trophée arraché à un dragon vaudrait un véritable trésor auprès des riches collectionneurs...
	AI_Output			(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //Mais ça ne m'intéresse pas. Je suis un marin, moi. Ma place est en mer, pas au fin fond d'un antre de dragon.

};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Torlof_KAP5_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_KAP5_EXIT_Condition;
	information	= DIA_Torlof_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Torlof_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	51;
	condition	 = 	DIA_Torlof_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Torlof_BEMYCAPTAIN_Info;

	description	 = 	"Vous êtes marin ?";
};

func int DIA_Torlof_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Torlof_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //C'est vrai, vous êtes marin ?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //C'est maintenant que vous vous en rendez compte ? Oui, en effet. Pourquoi cette question ?
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //Vous pourriez m'être utile. Je dois me rendre sur une île.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //(éclate de rire) Une île ? Vous n'avez même pas de bateau ni d'équipage !
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //Non, petit. Si vous voulez m'engager, que ce soit comme capitaine ou comme instructeur, il va falloir commencer par me prouver que vous savez de quoi vous parler.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //Et puis, j'ai d'autres sujets de préoccupation. Les paladins ne se sont pas retirés de la ville contrairement à ce que nous pensions.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //Il faudra quelque chose de très sérieux pour qu'ils s'en aillent.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //Allez au château de la Vallée des mines, volez la clé de la grande porte au garde de cette dernière et ouvrez afin que les orques puissent entrer dans la place. Ils se chargeront du reste.

	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);      
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);    
	B_LogEntry (TOPIC_Captain,"Avant que Torlof n'accepte le poste de capitaine, je dois convaincre les paladins de quitter la ville. Il a dit d'arranger un incident dans le château de la Vallée des mines. Il m'a demandé de voler la clef de la porte principale et de laisser les orques entrer. Il espère que cela poussera les paladins à quitter la ville pour aider leurs camarades.");
};                                                                                                                                                                                                                                                                                                                                                                                                                   
///////////////////////////////////////////////////////////////////////                                                                                                                                                                                                                                                                                                                                              
//	Info BeMyCaptain2s
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	52;
	condition	 = 	DIA_Torlof_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Torlof_BEMYCAPTAIN2_Info;

	description	 = 	"La porte du château de la Vallée des mines est ouverte...";
};

func int DIA_Torlof_BEMYCAPTAIN2_Condition ()
{
	if (MIS_OCGateOpen == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Torlof_BEMYCAPTAIN))
		{
			return TRUE;
		};
};

func void DIA_Torlof_BEMYCAPTAIN2_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //La grande porte du château de la Vallée des mines est ouverte et bloquée. Rien n'empêche plus les orques de se rendre maîtres de la place forte.
 	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //Les paladins du château ont subi de lourdes pertes face aux orques.
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //A mon avis, il ne faudra pas longtemps aux paladins de la ville pour se rendre dans la vallée pour aider leurs compagnons assiégés.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //Voilà une bonne nouvelle. Il n'y a donc plus rien qui m'empêche de fuir cette région maudite.
	B_GivePlayerXP (XP_Ambient);
	
};
///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	53;
	condition	 = 	DIA_Torlof_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Torlof_BEMYCAPTAIN3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Maintenant m’aiderez-vous à me rendre sur l'île ?";
};
var int Torlof_PaidToBeCaptain;
func int DIA_Torlof_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Torlof_BEMYCAPTAIN2))
		&& (Torlof_PaidToBeCaptain == FALSE)
		&& (SCGotCaptain == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Torlof_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //Vous êtes d'accord pour m'aider à me rendre sur mon île maintenant ?
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //Ah, oui, c'est vrai. Hmm... j'ai une proposition à vous faire.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //Je veux bien être le capitaine dont vous avez besoin pour piloter votre bateau en échange de 2 500 pièces d'or.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //Et je vous aiderai également à améliorer votre force et votre agilité.

	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "Cela fait beaucoup d'or.", DIA_Torlof_BEMYCAPTAIN3_zuViel );
	Info_AddChoice	(DIA_Torlof_BEMYCAPTAIN3, "Très bien. Voici votre or.", DIA_Torlof_BEMYCAPTAIN3_ok );

};
func void DIA_Torlof_BEMYCAPTAIN3_zuViel ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //Ça fait beaucoup d'argent...
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //Les spécialistes se payent cher. Et puis ce n'est pas comme si vous aviez le choix. Vous ne trouverez personne d'autre qui soit capable de piloter votre bateau dans les environs.
	AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //Alors payez et ne me causez pas d'ennuis.
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry (TOPIC_Captain,"Torlof a accepté de commander le navire. Mais il veut un dédommagement de 2 500 pièces d'or.");     
};

func void DIA_Torlof_BEMYCAPTAIN3_ok ()
{
	AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //D'accord, voici votre argent.
	if (B_GiveInvItems (other, self, ItMi_Gold,	2500))
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //Splendide ! Bien, il ne vous reste plus qu'à me dire ce que je suis censé faire.
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry (TOPIC_Captain,"Maintenant que je lui ai donné 2 500 pièces d'or, Torlof est prêt à partir avec moi.");     
	}
	else
	{
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //Vous essayez de me flouer ou quoi ? Payez-moi et on verra.
	};
	Info_ClearChoices	(DIA_Torlof_BEMYCAPTAIN3);
};


///////////////////////////////////////////////////////////////////////
//	Info BEMYCAPTAIN4
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN4		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	54;
	condition	 = 	DIA_Torlof_BEMYCAPTAIN4_Condition;
	information	 = 	DIA_Torlof_BEMYCAPTAIN4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Soyez mon capitaine.";
};

func int DIA_Torlof_BEMYCAPTAIN4_Condition ()
{
	if  (SCGotCaptain == FALSE)
		&& (Torlof_PaidToBeCaptain == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Torlof_BEMYCAPTAIN4_Info ()
{
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //Je vous veux comme capitaine.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //Très bien. Trouvez-moi un bateau et un équipage compétent, et je vous mène à votre satanée île.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //Vous avez une carte marine ? Sans ça on n'ira pas loin.
		AI_Output			(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //Je m'en charge et je vous retrouve au port.
		AI_Output			(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_04"); //Je suis impatient de voir comment vous allez vous y prendre...
	
		AI_StopProcessInfos (self);
		SCGotCaptain = TRUE;
		TorlofIsCaptain = TRUE;
		self.flags = NPC_FLAG_IMMORTAL;
		Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
		
		B_GivePlayerXP (XP_Captain_Success);              

};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_LOSFAHREN		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	59;
	condition	 = 	DIA_Torlof_LOSFAHREN_Condition;
	information	 = 	DIA_Torlof_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Faisons voile vers l'île.";
};

func int DIA_Torlof_LOSFAHREN_Condition ()
{
	if (TorlofIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Torlof_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //Partons pour l'île.

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //Très bien. Donnez-moi la carte et nous y allons.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //(crie) Tout le monde à bord !
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //Assurez-vous de bien avoir tout ce dont vous avez besoin. On ne fera pas demi-tour.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //Si vous en êtes sûr, allez vous installer dans la cabine du capitaine. Le voyage risque d'être long.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //Pas de bateau ni d'équipage ou de carte maritime égale pas de voyage, mon ami.
	AI_Output			(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //Je veux au moins cinq hommes aptes à naviguer.
	AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	SLD_801_Torlof;
	nr		 = 	59;
	condition	 = 	DIA_Torlof_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Torlof_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai choisi un autre capitaine.";
};

func int DIA_Torlof_PERM5_NOTCAPTAIN_Condition ()
{
	if	(SCGotCaptain == TRUE)
		&&	(TorlofIsCaptain == FALSE)
		&& 	(Torlof_PaidToBeCaptain == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Torlof_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //J'ai décidé de prendre un autre capitaine. Rendez-moi mon argent.
	AI_Output			(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //Vous aimeriez bien, hein ? Hors de question. Si vous ne voulez pas de mes services, c'est votre problème, mais je garde l'argent.
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Torlof_KAP6_EXIT(C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_KAP6_EXIT_Condition;
	information	= DIA_Torlof_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Torlof_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Torlof_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Torlof_PICKPOCKET (C_INFO)
{
	npc			= SLD_801_Torlof;
	nr			= 900;
	condition	= DIA_Torlof_PICKPOCKET_Condition;
	information	= DIA_Torlof_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Torlof_PICKPOCKET_Condition()
{
	C_Beklauen (76, 120);
};
 
FUNC VOID DIA_Torlof_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Torlof_PICKPOCKET);
	Info_AddChoice		(DIA_Torlof_PICKPOCKET, DIALOG_BACK 		,DIA_Torlof_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Torlof_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Torlof_PICKPOCKET_DoIt);
};

func void DIA_Torlof_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Torlof_PICKPOCKET);
};
	
func void DIA_Torlof_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Torlof_PICKPOCKET);
};

































































