// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_garond_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_EXIT_Condition;
	information	= DIA_Garond_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Garond_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garond_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Garond_LastPetzCounter;
var int Garond_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Garond_PMSchulden (C_INFO)
{
	npc         = PAL_250_Garond;
	nr          = 1;
	condition   = DIA_Garond_PMSchulden_Condition;
	information = DIA_Garond_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Garond_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Garond_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garond_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Je n'ai rien à vous dire tant que vous n'aurez pas payé votre amende.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //Et elle vient d'augmenter compte tenu des dernières accusations en date.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Apparemment, vous avez encore eu de nouveaux ennuis...
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //J'espère que vous avez l'intention de tout me régler d'un coup. Si je totalise le tout, cela fait...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Vous me décevez beaucoup. Votre amende se monte à...
		};
				
		var int diff; diff = (B_GetTotalPetzCounter(self) - Garond_LastPetzCounter);
		
		if (diff > 0)
		{
			Garond_Schulden = Garond_Schulden + (diff * 50);
		};
		
		if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
		B_Say_Gold (self, other, Garond_Schulden);
	}
	else if (B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Il y a du nouveau.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //D'un seul coup, vous n'êtes plus accusé de meurtre.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Plus personne ne se rappelle vous avoir vu commettre un vol.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //Il n'y a plus de témoins affirmant que vous avez pris part à des rixes.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //On dirait que toutes les charges retenues contre vous ont été abandonnées.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //J'ignore ce qui s'est passé au juste, mais je vous préviens : n'allez pas trop loin !
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //J'ai décidé d'annuler votre dette.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //Mais évitez les ennuis tant que vous êtes au château !
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Que les choses soient claires. Vous devrez tout de même payer votre amende dans sa totalité.
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //Alors, quelle est votre réponse ?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Je n'ai pas assez d'or.",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"C'est combien déjà ?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Je veux payer l'amende !",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Quel est le prix déjà ?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Je n'ai pas assez d'or.",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"C'est combien déjà ?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"Je veux payer l'amende !",DIA_Garond_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Garond_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Garond_PETZMASTER   (C_INFO)
{
	npc         = PAL_250_Garond;
	nr          = 1;
	condition   = DIA_Garond_PETZMASTER_Condition;
	information = DIA_Garond_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Garond_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_PETZMASTER_Info()
{
	Garond_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //C'est donc vous qui avez causé des ennuis au château...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //Je me demandais quand vous finiriez par venir me trouver...
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Je n'ai vraiment pas besoin d'un meurtrier ici.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //J'ai besoin de tous mes hommes ! Et maintenant, je me retrouve avec un de moins !
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //Sans même parler des autres affaires dans lesquelles vous êtes impliqué.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Laissez-moi vous expliquer quelque chose : nous sommes tous dans le même bateau ici.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //Et j'ai désespérément besoin de tous mes hommes, vous compris.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Si vous avez envie de tuer quelqu'un, il vous suffit de sortir du château. Il y a des tas d'orques dehors...
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Je vais vous mettre à l'amende, bien que je déteste avoir à me mêler de ce genre de chose.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //On raconte que vous vous êtes livré à quelques larcins par ici.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //Sans même parler de ce que j'ai entendu d'autre à votre sujet.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Vous n'allez pas vous en tirer comme ça. On dirait que vous n'avez pas idée de la gravité de notre situation.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Vous allez devoir verser une amende en compensation de vos crimes !
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Je déteste que mes hommes se battent entre eux.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //Et cette histoire de mouton n'arrange rien.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Je vais vous mettre à l'amende pour cela.
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Vous vous amusez à tuer nos moutons ? Ils nous appartiennent à tous.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Vous allez me payer la valeur de leur viande.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Combien ?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Je n'ai pas assez d'or.",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Je veux payer l'amende !",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Je veux payer l'amende !
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Très bien. Dans ce cas, je vais dire aux hommes de se calmer. Mais que je ne vous y reprenne pas !

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Je n'ai pas assez d'argent.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //Dans ce cas, vous viendrez me payer dès que vous l'aurez.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //Mais je vous préviens : continuez de nous causer des ennuis et le montant de l'amende grimpera !
	
	Garond_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Garond_Hello (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Hello_Condition;
	information	= DIA_Garond_Hello_Info;
	IMPORTANT 	= TRUE;
	permanent	= FALSE;
};                       

FUNC INT DIA_Garond_Hello_Condition()
{
	if (Kapitel == 2)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garond_Hello_Info()
{	
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //D'où venez-vous ? Vous ne faites pas partie de mes hommes et vous n'êtes pas non plus un mineur... Alors ?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Je suis venu par le col.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Le col ? Vous avez réussi à le franchir ? Par Innos !
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Pourquoi avez-vous choisi cette voie, magicien ?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Quels sont vos ordres, soldat ?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Je me demande quelle raison un mercenaire peut avoir de s'imposer tout cela. Qu'est-ce que vous faites ici ?
		};
};

//**********************************
//	Ich brauch Beweise 
//**********************************

INSTANCE DIA_Garond_NeedProof (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 1;
	condition	= DIA_Garond_NeedProof_Condition;
	information	= DIA_Garond_NeedProof_Info;
	description = "Je viens de la part du seigneur Hagen.";
};                       

FUNC INT DIA_Garond_NeedProof_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garond_Hello))
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&&	(Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garond_NeedProof_Info()
{		
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Je viens de la part du seigneur Hagen. Il veut que je lui ramène la preuve que les dragons existent bel et bien.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //Et vous êtes venu ici juste pour obtenir cette preuve et vous sauver comme un voleur ?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //C'est ce que j'avais en tête, oui...
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //Ainsi, il faut des preuves au seigneur Hagen ? Très bien, il les aura. Mais je ne peux pas vous laisser retourner vers lui sans lui communiquer également des renseignements au sujet du minerai.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //Ecoutez, le seigneur Hagen doit absolument savoir quelle est la situation et combien de minerai nous avons extrait jusqu'à présent.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //Très bien, que voulez-vous que je fasse pour vous ?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //J'ai trois groupes de mineurs dehors, mais ils ne m'envoient plus une seule pépite.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Rendez-vous aux sites miniers et revenez me dire quelle quantité de minerai a été extraite.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //A ce moment-là je rédigerai une lettre que vous pourrez ramener au seigneur Hagen.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Bon, d'accord. J'imagine que je n'ai pas le choix, de toute façon.
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Avant de me renvoyer, le commandant Garond veut que je débusque les trois escouades de mineurs et que je lui dise quelle quantité de minerai ils ont amassée.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Le commandant Garond m'a confié une mission. Il a envoyé trois escouades de mineurs ramasser du minerai magique. Pour l'instant, ils n'ont rien ramené.");
	B_LogEntry (TOPIC_ScoutMine,"Je dois trouver les trois escouades de mineurs et savoir quelle quantité de minerai ils ont amassé.");

};
// ************************************************************
// 			  Warum ich?
// ************************************************************

INSTANCE DIA_Garond_Why (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Why_Condition;
	information	= DIA_Garond_Why_Info;
	permanent	= FALSE;
	description = "Mais pourquoi moi ?";
};                       

FUNC INT DIA_Garond_Why_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Why_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Mais... pourquoi moi ?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Parce que vous connaissez le moyen de franchir les lignes adverses. Mes hommes seraient perdus si je les chargeais de cette mission.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //Vous, par contre, vous êtes déjà passé une fois. C'est donc vous qui êtes le plus à même de mener cette mission à bien.
};
// ************************************************************
// 			Ausrüstung
// ************************************************************

INSTANCE DIA_Garond_Equipment (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Equipment_Condition;
	information	= DIA_Garond_Equipment_Info;
	permanent	= FALSE;
	description = "J'ai besoin d'équipement.";
};                       

FUNC INT DIA_Garond_Equipment_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& ((other.guild == GIL_KDF)
	||  (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Equipment_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //J'aurais besoin d'équipement.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Allez voir Milten le magicien ici au château. Il saura de quoi vous avez besoin.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Allez voir Tandor. Il vous fournira tout ce dont vous avez besoin.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor vend des armes au château.");
	};
};
// ************************************************************
// 			Zahlen
// ************************************************************

INSTANCE DIA_Garond_zahlen (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_zahlen_Condition;
	information	= DIA_Garond_zahlen_Info;
	permanent	= FALSE;
	description = "Combien me paierez-vous pour ce travail ?";
};                       

FUNC INT DIA_Garond_zahlen_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_zahlen_Info()
{		
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Combien me paierez-vous si je fais ça pour vous ?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //(irrité) Je ne suis pas du genre à marchander avec les mercenaires.
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Bon, j'imagine que je n'ai pas le choix. Je suis prêt à vous offrir 500 pièces d'or si vous menez cette mission à bien.
};
// ************************************************************
// 	Wo finde ich die Schürfstellen?
// ************************************************************

INSTANCE DIA_Garond_Wo (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Wo_Condition;
	information	= DIA_Garond_Wo_Info;
	permanent	= FALSE;
	description = "Où puis-je trouver les sites d'extraction ?";
};                       

FUNC INT DIA_Garond_Wo_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Wo_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //Où se trouvent les sites miniers ?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Tenez, prenez cette carte. Les deux zones où les sites miniers sont situés y sont indiquées.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Si vous avez des questions, posez-les à Parcival. Il vous dira tout ce que vous voulez savoir sur les mineurs.
	
	B_LogEntry (TOPIC_ScoutMine,"Le paladin Parcival peut me donner des informations sur les mineurs.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Malédiction ! Qu'est-ce qui se passe, ici ? Béliar lui-même est-il venu pour nous achever ?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Mes hommes sont presque tous morts et avec le peu de minerai qu'il nous reste, nous serions bien incapables d'arrêter ne serait-ce qu'un seul orque, alors une armée entière...
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Cette expédition est vouée à l'échec.
};

// ************************************************************
// 	Fajeth
// ************************************************************
INSTANCE DIA_Garond_Fajeth (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Fajeth_Condition;
	information	= DIA_Garond_Fajeth_Info;
	permanent	= FALSE;
	description = "J'ai parlé à Fajeth.";
};                       

FUNC INT DIA_Garond_Fajeth_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Fajeth_Ore == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Fajeth_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //J'ai parlé à Fajeth.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Qu'a-t-il à me dire ?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Ses hommes ont extrait suffisamment de minerai pour remplir deux coffres.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Deux coffres ? C'est deux cents qu'il m'en faudrait !
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Il m'a demandé de vous dire qu'il avait besoin de davantage d'hommes.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Quoi ? Il voudrait que j'envoie encore plus d'hommes à une mort certaine ? Il ferait mieux d'oublier cela tout de suite.
 	
 	Ore_Counter = (Ore_Counter +1);
 	B_GivePlayerXP (XP_Fajeth_Ore);
 	
 	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};

// ************************************************************
// 	Silvestro
// ************************************************************
INSTANCE DIA_Garond_Silvestro (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Silvestro_Condition;
	information	= DIA_Garond_Silvestro_Info;
	permanent	= FALSE;
	description = "A propos du site d'extraction de Silvestro...";
};                       

FUNC INT DIA_Garond_Silvestro_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Silvestro_Ore == TRUE)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Silvestro_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Pour ce qui est du site minier de Silvestro...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Vous l'avez vu ? Vous avez pu lui parler ?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Tout le monde est mort là-bas. Ils ont été surpris par des foreurs des mines.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //Et qu'en est-il du minerai ? Savez-vous quelle quantité ils avaient réussi à extraire ?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Quelques coffres. Ils se trouvent dans une grotte située entre le château et le site minier.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Malédiction ! C'étaient des hommes bien. Puisse Innos avoir pitié de leur âme...
	
	Ore_Counter = (Ore_Counter +1);
	B_GivePlayerXP (XP_Silvestro_Ore);
	
	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};
// ************************************************************
// 	Marcos
// ************************************************************
INSTANCE DIA_Garond_Marcos (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Marcos_Condition;
	information	= DIA_Garond_Marcos_Info;
	permanent	= FALSE;
	description = "J'ai rencontré Marcos.";
};                       

FUNC INT DIA_Garond_Marcos_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Marcos_Ore == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Marcos_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //J'ai vu Marcos.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //Et ? Que vous a-t-il appris ? Combien de minerai a-t-il pour nous ?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Quatre coffres. Il a quitté le site minier afin de mettre le minerai en sécurité.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Il garde désormais les coffres dans une vallée étroite situé derrières les lignes orques, mais il a grand besoin de renforts.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Quoi ? Quatre coffres seulement et il a quitté le site ? Malédiction ! Ce n'est pas bon du tout...
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //Et il lui faut davantage d'hommes ? Très bien, je vais lui en envoyer deux.
	
	
	Marcos_Guard1.flags = 0;
	Marcos_Guard2.flags = 0;
	
	B_StartOtherRoutine (Marcos_Guard1,"MARCOS");
	B_StartOtherRoutine (Marcos_Guard2,"MARCOS");
	
	AI_Teleport (Marcos_Guard1,"OW_STAND_GUARDS");
	AI_Teleport (Marcos_Guard1,"OW_STAND_GUARDS");
	
	Ore_Counter = (Ore_Counter +1);
	MIS_Marcos_Jungs = LOG_SUCCESS;

	B_GivePlayerXP (XP_Marcos_Ore);
	
	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};		
// ************************************************************
// Info Success
// ************************************************************

INSTANCE DIA_Garond_Success (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Success_Condition;
	information	= DIA_Garond_Success_Info;
	permanent	= FALSE;
	description = "Et en ce qui concerne la lettre pour le seigneur Hagen ?";
};                       

FUNC INT DIA_Garond_Success_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Success_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Success_15_00"); //Et qu'en est-il de la lettre pour le seigneur Hagen ?
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //Nous avons un total de dix coffres de minerai... et nous avons perdu deux fois plus d'hommes de valeur pour les obtenir.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Vous allez avoir votre lettre. Il faut absolument que le seigneur Hagen soit mis au courant. Cette vallée est maudite !
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Le commandant Garond m'a remis une lettre. Cela devrait être une preuve suffisante. Je peux la remettre au seigneur Hagen.");
	
	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP (XP_ScoutMine);
	MIS_ReadyForChapter3  = TRUE; 	//Joly: Bei Levelchange ab hier in die Newworld  -> Kapitel 3!!!!!!
	B_NPC_IsAliveCheck (OldWorld_Zen);
};
// ************************************************************
// SLD bezahlen
// ************************************************************

INSTANCE DIA_Garond_SLD (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_SLD_Condition;
	information	= DIA_Garond_SLD_Info;
	permanent	= FALSE;
	description = "Et en ce qui concerne ma paie ?";
};                       

FUNC INT DIA_Garond_SLD_Condition()
{
	if (MIS_ScoutMine == LOG_SUCCESS)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_SLD_Info()
{		
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //Et en ce qui concerne ma paie ?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //Ah, oui, c'est vrai ! Tenez, voici l'argent que je vous dois.
	B_GiveInvItems (self, other, itMI_Gold, 500);
};
// ************************************************************
// Info Perm wenn Scout Mine == RUNNING
// ************************************************************
INSTANCE DIA_Garond_Running (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 10;
	condition	= DIA_Garond_Running_Condition;
	information	= DIA_Garond_Running_Info;
	permanent	= TRUE;
	description = "Où en est la situation ?";
};                       

FUNC INT DIA_Garond_Running_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Running_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Comment ça va ?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //J'attends des nouvelles en provenance du dernier site minier, en espérant qu'elles seront bonnes.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //J'ai besoin d'un rapport concernant les deux derniers sites et après, nous verrons.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Vous devriez vous rendre aux sites miniers. J'ai désespérément besoin de renseignements concernant la quantité de minerai extraite.
	};
	
};
// ************************************************************
// Gorn
// ************************************************************

INSTANCE DIA_Garond_Gorn (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Gorn_Condition;
	information	= DIA_Garond_Gorn_Info;
	permanent	= FALSE;
	description = "Je voudrais que vous libériez Gorn.";
};                       

FUNC INT DIA_Garond_Gorn_Condition()
{
	if (Npc_KnowsInfo (other, DIA_MiltenOW_Gorn))
	&& (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_Garond_NeedProof))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Gorn_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Je souhaiterais que vous laissiez partir Gorn.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //C'est impossible. Il a commis de nombreux crimes et il faut qu'il paye.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Puis-je payer l'amende à sa place ?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //C'est une possibilité, en effet, mais cela va vous coûter cher... 1 000 pièces d'or, pour être exact.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //Cela fait beaucoup.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //Je vous l'ai dit, il a de nombreux crimes à son actif. Apportez-moi l'or et je le libérerai.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Garond veut mille pièces d'or pour libérer Gorn.");
};
// ************************************************************
// Gorn freikaufen
// ************************************************************

INSTANCE DIA_Garond_Pay (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Pay_Condition;
	information	= DIA_Garond_Pay_Info;
	permanent	= TRUE;
	description = "Je veux acheter la liberté de Gorn. (Payer 1 000 pièces d'or)";
};                       
FUNC INT DIA_Garond_Pay_Condition()
{
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Pay_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Je souhaite acheter la liberté de Gorn.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //D'accord. Allez voir Gérold et dites-lui de relâcher Gorn sur mon ordre.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"J'ai payé Garond. Maintenant, je peux sortir Gorn de la prison. Le garde Gérold le laissera partir.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //Dans ce cas amenez-moi les 1 000 pièces d'or que je vous ai demandées.
	};	
};
// ************************************************************
// Info Perm in Kap.2
// ************************************************************
INSTANCE DIA_Garond_Perm2 (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 9;
	condition	= DIA_Garond_Perm2_Condition;
	information	= DIA_Garond_Perm2_Info;
	permanent	= TRUE;
	description = "Que comptez-vous faire maintenant ?";
};                       

FUNC INT DIA_Garond_Perm2_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garond_Success)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Perm2_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Que comptez-vous faire maintenant ?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //J'ai tout essayé. Vous êtes désormais mon seul espoir... vous, et le fait que le seigneur Hagen nous envoie des renforts.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Nous allons continuer à résister en priant Innos pour qu'il nous soutienne dans ces heures sombres...
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

INSTANCE DIA_Garond_KAP3_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP3_EXIT_Condition;
	information	= DIA_Garond_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGibtsNeues
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_WASGIBTSNEUES		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	30;
	condition	 = 	DIA_Garond_WASGIBTSNEUES_Condition;
	information	 = 	DIA_Garond_WASGIBTSNEUES_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quoi de neuf ?";
};

func int DIA_Garond_WASGIBTSNEUES_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEUES_Info ()
{
	AI_Output (other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //Quoi de neuf ?
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Enfer ! Qu'est-ce que vous fabriquez ? J'ai besoin de ces renforts !
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Même Milten a quitté le château. Mais je n'ai pas besoin de moins d'hommes ! C'est davantage qu'il m'en faut !
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

INSTANCE DIA_Garond_KAP4_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP4_EXIT_Condition;
	information	= DIA_Garond_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_BACKINKAP4		(C_INFO)
{
	npc		 = 	PAL_250_Garond;
	nr		 = 	12;
	condition	 = 	DIA_Garond_BACKINKAP4_Condition;
	information	 = 	DIA_Garond_BACKINKAP4_Info;
	Permanent	 =	FALSE;
	description	 = 	"Je suis de retour.";
};

func int DIA_Garond_BACKINKAP4_Condition ()
{
	if (Kapitel == 4)
		{
				return TRUE;
		};
};

func void DIA_Garond_BACKINKAP4_Info ()
{
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Je suis de retour.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //Je le vois bien. Où sont les renforts ?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Le seigneur Hagen arrivera dès qu'il aura tout réglé. Il s'est passé beaucoup de choses.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //Je m'en moque. J'ai besoin d'hommes. Les orques sont de plus en plus nombreux et nous ne tiendrons pas longtemps.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Mes hommes sont épuisés et nous manquons de provisions.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Des volontaires viennent d'arriver.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Vous voulez parler de vous et des autres chasseurs de dragons, hein ? Vous pouvez certes nous être utiles, mais vous n'êtes pas assez nombreux.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Vous voulez parler des chasseurs de dragons qui attendent dans la cour ? Ils peuvent certes nous être utiles, mais ils ne sont pas assez nombreux.
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Je ne peux rien promettre si Hagen ne nous envoie pas des hommes d'urgence.

	B_InitNpcGlobals ();//Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	//-----------------------------------------
	AI_Teleport 		 (DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");	
	B_StartOtherRoutine 	(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;


	// Die Drachenjäger vom Spielstart verziehen sich in ihr Lager.
	//-----------------------------------------
	B_StartOtherRoutine 	(Kjorn,	"START");
	B_StartOtherRoutine 	(Godar,	"START");
	B_StartOtherRoutine 	(Hokurn,"START");
	B_StartOtherRoutine 	(PC_Fighter_DJG,"START");
	B_StartOtherRoutine  (Kurgan,"START");

	if 	(DJG_BiffParty == FALSE)
	{
	B_StartOtherRoutine 	(Biff,"START");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	11;
	condition	 = 	DIA_Garond_DragonPlettBericht_Condition;
	information	 = 	DIA_Garond_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"A propos des dragons...";
};

var int DIA_Garond_DragonPlettBericht_NoPerm;
func int DIA_Garond_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Garond_BACKINKAP4))
	&& (DIA_Garond_DragonPlettBericht_NoPerm == FALSE)
	{
		return TRUE;
	};
};

var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int Garond_OricExperte_OneTime;
func void DIA_Garond_DragonPlettBericht_Info ()
{
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond est très intéressé par la situation avec les dragons bien qu'il donne l'impression de ne pas s'en soucier."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //J'ai des nouvelles au sujet des dragons.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Faites-moi votre rapport.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //J'ai tué le dragon du marais qui s'étend à l'est d'ici.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Le dragon de la forteresse de pierre du sud a cessé de vivre.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Le dragon de feu du volcan du sud ne causera plus jamais d'ennuis à personne.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Je suis allé dans la région glacée de l'ouest et j'ai tué le dragon qui s'y trouvait.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //C'est une excellente nouvelle. Tenez, voici de quoi acheter davantage d'équipement.
		
		DrachenGeld = (CurrentDragonCount * Garond_KilledDragonGeld);
		XP_LocalGarond =  (CurrentDragonCount * XP_Garond_KilledDragon);

		B_GivePlayerXP (XP_LocalGarond);

		CreateInvItems (self, ItMi_Gold, DrachenGeld);									
		B_GiveInvItems (self, other, ItMi_Gold, DrachenGeld);					

		Garond_DragonCounter = MIS_KilledDragons;

		if (MIS_AllDragonsDead == TRUE)
		{
			DIA_Garond_DragonPlettBericht_NoPerm = TRUE;
		};
	};
		
	if (Garond_OricExperte_OneTime == FALSE)
	&& ((Npc_IsDead(Oric))	== FALSE)
	&& (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Pouvez-vous me donner davantage de renseignements au sujet des dragons ?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //J'ai d'autres sujets de préoccupation. Vous n'avez qu'à évoquer le sujet avec Oric, mon officier en charge de la stratégie.
		B_LogEntry (TOPIC_DRACHENJAGD,"Le conseiller stratégique de Garond, Oric, peut avoir des informations utiles pour moi."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //D'autres attaques de dragon se sont-elles produites en mon absence ?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Non, heureusement. Pour le moment, ils semblent rester en retrait.
	};
};

//*********************************************************************
//	Ich habe alle drachen getötet
//*********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_AllDragonDead		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	12;
	condition	 = 	DIA_Garond_AllDragonDead_Condition;
	information	 = 	DIA_Garond_AllDragonDead_Info;
	Permanent	 =	FALSE;
	description	 = 	"Tous les dragons sont morts.";
};

func int DIA_Garond_AllDragonDead_Condition ()
{
	if (MIS_AllDragonsDead == TRUE)
	&& (DIA_Garond_DragonPlettBericht_NoPerm == TRUE)	
	&& (Kapitel >= 4)
	{
			return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info ()
{
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Tous les dragons sont morts.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //(incrédule) Tous ? Le Mal a donc été définitivement chassé ?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Non, hélas. Leur chef est toujours en vie.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Ce n'étaient pas les dragons qui dirigeaient les orques ?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Si, mais eux aussi obéissaient à un maître et nous devons également nous débarrasser de lui.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Je ne peux pas bouger d'ici. Il faut que je garde le minerai et ces maudits orques sont toujours dans les environs.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Il va vous falloir vous en charger seul. Je ne peux rien faire pour vous aider.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Qu'Innos vous protège.
};

///////////////////////////////////////////////////////////////////////
//	Mission JanBecomeSmith
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_JanBecomeSmith		(C_INFO)
{
	npc			= 	PAL_250_Garond;
	nr		 	= 	12;
	condition	= 	DIA_Garond_JanBecomeSmith_Condition;
	information	= 	DIA_Garond_JanBecomeSmith_Info;
	Permanent	=	TRUE;
	description	= 	"Il y a un problème avec le forgeron.";
};

func int DIA_Garond_JanBecomeSmith_Condition ()
{
	if (MIS_JanBecomesSmith == LOG_RUNNING)
		&& (Kapitel >= 4)
	{
			return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info ()
{
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //Il y a un problème avec le forgeron.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Quel forgeron ? Il s'est enfui dans les bois.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //Il est revenu ? Dans ce cas, vous pouvez lui dire que...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Non, je veux parler de Jan.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //C'est un chasseur de dragons, tout comme moi, mais aussi un bon forgeron.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Je veux parler de l'un des chasseurs de dragons, qui est également forgeron.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //Tant mieux. Le nôtre vient juste de s'enfuir. Quel poltron !
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan est disposé à s'occuper de remettre la forge en service.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Je vois. Et vous pensez que l'on peut lui faire confiance ?
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Oui.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Dans ce cas, je vous demanderai de vous porter garant pour lui.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //S'il nous pose le moindre problème, vous en serez responsable. Cela vous convient ?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Je vais y réfléchir.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Je me porterai garant pour Jan.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Je vais y réfléchir.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Comment voulez-vous que je lui fasse confiance si, même vous, vous éprouvez des doutes à son sujet ?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Si personne ne se porte garant pour ce Jan, il est hors de question qu'il mette les pieds à l'intérieur de la forge.

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Je suis prêt à me porter garant pour Jan.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Très bien. Dans ce cas, il peut se servir de la forge. Mais je lui demanderai également de fabriquer des armes pour mes hommes, cela va de soi.
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS; 
	B_GivePlayerXP (XP_Ambient);
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

INSTANCE DIA_Garond_KAP5_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP5_EXIT_Condition;
	information	= DIA_Garond_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm5
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_PERM5		(C_INFO)
{
	npc		 = 	PAL_250_Garond;
	nr		 = 	59;
	condition	 = 	DIA_Garond_PERM5_Condition;
	information	 = 	DIA_Garond_PERM5_Info;
	permanent	 = 	TRUE;

	description	 = 	"Comment ça se passe ?";
};

func int DIA_Garond_PERM5_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info ()
{
	AI_Output			(other, self, "DIA_Garond_PERM5_15_00"); //Comment ça va ?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //C'est un désastre ! Un sale traître a ouvert la grande porte ! C'est comme s'il nous avait jetés en pâture aux loups !
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Si j'arrive à mettre la main sur lui...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Nous allons tous mourir jusqu'au dernier si Hagen n'arrive pas bientôt.
	};
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


INSTANCE DIA_Garond_KAP6_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP6_EXIT_Condition;
	information	= DIA_Garond_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
































