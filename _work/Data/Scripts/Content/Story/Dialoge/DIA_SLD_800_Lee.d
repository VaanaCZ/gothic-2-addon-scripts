// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lee_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 999;
	condition   = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lee_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// **************
// B_Lee_Teleport
// **************

var int Lee_Teleport; //damit es nur EINMAL kommt
// ------------------

func void B_Lee_Teleport()
{
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Ah. Merci d'�tre venu.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Quoi de neuf ?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //J'ai trouv� ceci dans la vieille chapelle.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //C'est une rune magique. A mon avis, elle a pour fonction de t�l�porter son utilisateur ici, � la ferme.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Je me suis dit qu'elle pouvait vous �tre utile.
	
	Lee_Teleport = TRUE;
};


// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Lee_PMSchulden (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Lee_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lee_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_PMSchulden_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Vous apportez l'argent d'Onar�?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Je vous ai d�j� dit de ne rien faire de stupide ici.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar a entendu dire que vous �tiez devenu c�l�bre.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Donc, il veut d�sormais plus d'argent.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //Combien ?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Lee_LastPetzCounter);
		
			if (diff > 0)
			{
				Lee_Schulden = Lee_Schulden + (diff * 50);
			};
		
			if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Lee_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Je vous croyais plus intelligent que �a.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //Dans ce cas, j'ai de bonnes nouvelles pour vous.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //D'un coup, plus personne ne vous a vu commettre de meurtre.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Plus personne n'est dispos� � t�moigner que vous vous �tes livr� � ce vol.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Plus personne ne vous a vu tabasser l'un des fermiers.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Apparemment, toutes les charges retenues contre vous viennent de s'envoler d'un seul coup.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //C'est une fa�on de r�gler ce genre de probl�me.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Bref, vous n'avez plus � payer.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Mais surveillez vos actes � l'avenir.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Toutefois, une chose est s�re : vous devez quand m�me acquitter votre amende dans sa totalit�.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //Alors, quelle est votre r�ponse�?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Je n'ai pas assez d'or.",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"C'est combien d�j� ?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Je veux payer l'amende !",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Combien �a co�te d�j� ?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Je n'ai pas assez d'or.",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"C'est combien d�j� ?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Je veux payer l'amende !",DIA_Lee_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Lee_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Lee_PETZMASTER   (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Lee_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PETZMASTER_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //(surpris) Qui diable vous a laiss� entrer�? C'est bien vous qui nous causez tous ces ennuis, non�?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Gorn m'avait dit que vous �tiez encore en vie et que vous finiriez par venir ici.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Il est bien que vous vous soyez pr�sent� devant moi avant que votre cas ne s'aggrave.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Les mercenaires sont des durs et les fermiers ici ne sont pas exactement des tendres, mais vous ne pouvez pas vous balader et tuer les gens.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //Sans m�me parler des autres exactions auxquelles vous vous �tes livr�.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Je peux vous aider � vous blanchir totalement...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //Mais cela ne sera pas gratuit, loin de l�. Onar est cupide et cette affaire ne sera oubli�e que s'il accepte de fermer les yeux.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Vous avez bien fait de venir. Je me suis laiss� dire que vous aviez vol� quelque chose ici.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //Et que vous aviez frapp� les fermiers.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //Sans oublier le fait que vous aviez tu� leurs moutons.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //N'allez pas imaginer que vous allez vous en tirer comme �a dans la r�gion. Onar a insist� pour que le coupable paye.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //Cela signifie que vous payez et que lui se remplit les poches, mais au moins, l'affaire sera oubli�e.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Se battre en duel avec un mercenaire, c'est une chose...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //Mais quand on tabasse les fermiers, ils vont droit chez Onar pour se plaindre, et lui me demande d'agir.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Sans compter qu'il n'appr�cie gu�re que quelqu'un s'amuse � massacrer ses moutons.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Il faut payer l'amende. Evidemment, tout l'argent ira dans la poche d'Onar, mais c'est le seul et unique moyen de vous en sortir.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar m'a charg� de prot�ger sa ferme, et ses moutons en font partie.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Vous allez devoir lui verser une compensation.
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Combien ?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Je n'ai pas assez d'or.",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Je veux payer l'amende !",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Je veux payer l'amende !
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //Bien. Je veillerai � ce qu'Onar touche l'argent. Consid�rez que cette affaire est oubli�e.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Je n'ai pas assez d'argent.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //Alors procurez-vous le dans les plus brefs d�lais.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Mais n'allez pas penser que vous pouvez voler quoi que ce soit � la ferme. �a irait encore bien plus mal pour vous si vous veniez � vous faire prendre.
	
	Lee_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				 Hallo 
// ************************************************************
INSTANCE DIA_Lee_Hallo   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Hallo_Info()
{
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //(surpris) Qui diable vous a laiss� entrer�? Et qu'est-ce que vous fichez ici�? Je vous croyais mort�!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Qu'est-ce qui vous fait croire �a ?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn m'a dit que c'�tait vous qui aviez d�truit la Barri�re.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //C'est exact.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //Je n'aurais jamais cru qu'il �tait possible de survivre � �a. Qu'est-ce qui vous am�ne�? J'imagine que vous n'�tes pas ici sans raison.
};

// ************************************************************
// 			  				Paladine 
// ************************************************************
INSTANCE DIA_Lee_Paladine   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent   = FALSE;
	description = "Je dois absolument parler aux paladins en ville...";
};
FUNC INT DIA_Lee_Paladine_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Paladine_Info()
{
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Il est imp�ratif que je m'entretienne avec les paladins de la ville. Pouvez-vous m'aider � y parvenir�?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(m�fiant) Qu'est-ce que vous leur voulez�?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //C'est une longue histoire...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //J'ai tout mon temps.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(soupire) Xardas m'a charg� d'une mission. Il souhaite que je r�cup�re une puissante amulette, l'�il d'Innos.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Ainsi, vous �tes encore en cheville avec le n�cromancien. Je vois. Et cette amulette est en possession des paladins�?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //Pour autant que je sache, oui.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Je peux vous aider � approcher les paladins, mais vous devez d'abord devenir l'un des n�tres.
};

// ************************************************************
// 			  				PaladineHOW
// ************************************************************
INSTANCE DIA_Lee_PaladineHOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 3;
	condition   = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent   = FALSE;
	description = "Comment pouvez-vous m'aider � approcher les paladins ?";
};
FUNC INT DIA_Lee_PaladineHOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PaladineHOW_Info()
{
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //Comment pouvez-vous m'aider � les approcher�?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Faites-moi confiance, j'ai un plan. Je pense que vous �tes exactement l'homme qu'il nous faut...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Je vous am�nerai aux paladins si vous me rendez service. Mais vous devez d'abord vous joindre � nous.
};

// ************************************************************
// 			  				Lees Plan
// ************************************************************
INSTANCE DIA_Lee_LeesPlan (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent   = FALSE;
	description = "Que faites-vous exactement ici ?";
};
FUNC INT DIA_Lee_LeesPlan_Condition()
{
	if (Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lee_LeesPlan_Info()
{
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Qu'est-ce que vous faites ici, au juste�?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //C'est tr�s simple�: j'essaye de faire en sorte que nous quittions tous cette �le.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar nous a engag�s pour d�fendre sa ferme, et c'est exactement ce que nous allons faire.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Et nous ne gagnons pas que notre salaire, car en aidant les fermiers, nous emp�chons la ville d'�tre approvisionn�e.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //Et moins les paladins ont � manger, plus ils se montreront conciliants quand nous leur feront enfin une proposition de paix.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Dommage que vous vous soyez joint � eux...
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //A quoi votre proposition ressemblera-t-elle�?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //En r�sum�, disons que nous exigerons d'�tre tous pardonn�s et de b�n�ficier du libre passage vers le continent. Mais vous en saurez davantage le moment venu.
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
INSTANCE DIA_Lee_WannaJoin (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent   = FALSE;
	description = "Je veux me joindre � vous !";
};
FUNC INT DIA_Lee_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Je veux me joindre � vous !
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //J'esp�rais que vous me r�pondriez �a. C'est que j'ai besoin de tous les hommes en bonne sant�.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Les derniers mercenaires que j'ai accept�s n'ont fait que nous causer des ennuis.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //En principe, vous pouvez commencer sans attendre. Enfin, il y a d'abord une ou deux petites choses � r�gler, mais ce n'est pas grand-chose.
};

// ************************************************************
// 			  				ClearWhat
// ************************************************************
INSTANCE DIA_Lee_ClearWhat (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent   = FALSE;
	description = "Qu'y a-t-il � 'r�gler' avant de me joindre � vous ?";
};
FUNC INT DIA_Lee_ClearWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ClearWhat_Info()
{
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Que sont ces 'petites choses' � r�gler ?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Notre employeur est Onar, le propri�taire terrien. Vous ne pourrez rester � la ferme qu'avec son approbation.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //Et puis, il y a les autres hommes�: je ne peux vous accepter que si la majorit� des mercenaires est d'accord pour que vous vous joigniez � nous.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Mais n'allez pas voir Onar avant que tout soit r�gl�. Il est extr�mement impatient...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Pour �tre accept� en tant que mercenaire, je dois obtenir l'approbation d'Onar une fois que j'aurai persuad� les mercenaires.");
};

// ************************************************************
// 			  				OtherSld
// ************************************************************
INSTANCE DIA_Lee_OtherSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 7;
	condition   = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent   = FALSE;
	description = "Comment puis-je convaincre les mercenaires de voter pour moi ?";
};
FUNC INT DIA_Lee_OtherSld_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_OtherSld_Info()
{
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Comment puis-je convaincre les mercenaires de m'accepter�?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //En faisant votre m�tier de mercenaire j'imagine.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Allez voir Torlof, vous devriez le trouver devant la maison. C'est lui qui vous �valuera.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Si vous passez l'�preuve avec succ�s, vous aurez gagn� une bonne partie du respect n�cessaire.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Il vous dira tout ce que vous avez besoin de savoir.
	
	B_LogEntry (TOPIC_BecomeSLD,"Pour �tre accept� comme mercenaire, je dois passer l'�preuve de Torlof et gagner le respect des autres mercenaires.");
};
			
///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lee_Ranger		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lee_Ranger_Condition;
	information	 = 	DIA_Addon_Lee_Ranger_Info;

	description	 = 	"Que savez-vous sur l'Anneau de l'eau ?";
};

func int DIA_Addon_Lee_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (SC_KnowsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lee_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Que savez-vous sur l'Anneau de l'eau ?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(rire) J'aurais d� m'en douter. Il faut que vous m�liez de tout, n'est-ce pas ?
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //Allez. Dites-moi.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Je ne suis m�l� � cela que de loin. Je sais que cette confr�rie secr�te existe ici et que les Mages de l'eau sont derri�re cela.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Depuis la chute de la Barri�re, je ne suis plus tenu � cet ancien accord qui me liait aux Mages de l'eau.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Bien s�r, j'aide toujours d�s que je peux. Mais la plupart du temps, j'ai mes propres probl�mes et tr�s peu de temps pour d'autres choses.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Si vous voulez en savoir plus, vous devriez sans doute parler � Cord. Il est l'un des leurs, autant que je sache.
		
	RangerHelp_gildeSLD = TRUE;	
	SC_KnowsCordAsRangerFromLee = TRUE;
};			
			
// ************************************************************
// 			  				JoinNOW
// ************************************************************
var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

INSTANCE DIA_Lee_JoinNOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 8;
	condition   = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent   = TRUE;
	description = "Je suis pr�t � me joindre � vous !";
};
FUNC INT DIA_Lee_JoinNOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (Lee_OnarOK == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_JoinNOW_Info()
{
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Je suis pr�t � me joindre � vous.
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Il faut d'abord que vous passiez l'�preuve de Torlof.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Alors, vous avez pass� l'�preuve de Torlof�?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Oui.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //C'est bien.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Qu'en disent les autres mercenaires�?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Je ne suis pas s�r d'en avoir suffisamment de mon c�t�.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //Dans ce cas, allez voir Torlof. Il est au courant de tout ce qui se dit � la ferme.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //La plupart d'entre eux sont avec moi.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //Bien. Dans ce cas, allez voir Onar sans attendre. Je lui ai d�j� parl� de vous.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Mais ce sera � vous de n�gocier votre salaire.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Maintenant, je n'ai besoin que de l'accord d'Onar.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Avez-vous vu Onar�?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Il est d'accord.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //Bienvenue � bord, petit�!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Tenez, commencez par prendre une armure potable.
			Npc_SetTrueGuild (other, GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine (Lothar, "START");
			
			CreateInvItems (other, ItAr_Sld_L, 1);
			AI_EquipArmor (other, ItAr_Sld_L);
						
			Snd_Play ("LEVELUP"); 
	
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			B_GivePlayerXP (XP_BecomeMercenary);
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Je suis heureux de vous avoir avec nous.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //J'ai d�j� une mission � vous confier.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Elle est en rapport avec les paladins. Il est grand temps que vous alliez les voir.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //De toute fa�on c'est ce que vous vouliez faire, alors...
		};
	};
};

// ************************************************************
// 			  				KEIN SLD
// ************************************************************
INSTANCE DIA_Lee_KeinSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_KeinSld_Condition()
{
	if ( (other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KeinSld_Info()
{
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Je vois que vous vous �tes mis au service des paladins.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //Vous �tes entr� au monast�re�? (�clate de rire) Alors �a, si je m'attendais...
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //Vous ne pouvez plus devenir mercenaire maintenant.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Mais qui sait... Peut-�tre pourrons-nous quand m�me nous rendre mutuellement service...
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Nous verrons bien. En attendant, je vous souhaite bonne chance.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Mais n'essayez pas de me jouer un sale tour, pig�?
};

// ************************************************************
// 			  				ToHagen
// ************************************************************
INSTANCE DIA_Lee_ToHagen(C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent   = FALSE;
	description = "Et comment puis-je approcher les paladins maintenant ?";
};
FUNC INT DIA_Lee_ToHagen_Condition()
{
	if (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ToHagen_Info()
{
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //Comment puis-je aller voir les paladins maintenant�?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //C'est tr�s simple, c'est vous qui allez leur apporter notre proposition de paix.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Je connais le seigneur Hagen, le commandant des paladins, pour avoir servi au sein de l'arm�e du roi.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Et je connais son mode de pens�e. Il n'a pas assez d'hommes. Il acceptera notre offre. Ou du moins, il vous �coutera.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Je lui ai �crit une lettre... Tenez.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //Elle devrait au moins vous permettre d'�tre admis en sa pr�sence.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee m'envoie porter une offre de paix au seigneur Hagen. Ainsi, je pourrai approcher les paladins.");
};
		
// ************************************************************
// 			  			AngebotSuccess
// ************************************************************
INSTANCE DIA_Lee_AngebotSuccess (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent   = FALSE;
	description = "J'ai port� au seigneur Hagen votre proposition de paix.";
};
FUNC INT DIA_Lee_AngebotSuccess_Condition()
{
	if (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AngebotSuccess_Info()
{
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //J'ai remis votre proposition de paix au seigneur Hagen.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //Et alors�? Qu'a-t-il r�pondu�?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Qu'il �tait dispos� � vous accorder son pardon, mais pas � vos hommes.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Faut-il qu'il soit born�! La plupart des soldats du roi sont de pires criminels que mes hommes�!
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Que comptez-vous faire maintenant�?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Il faut que je trouve un autre moyen de partir d'ici. Si besoin est, nous nous emparerons d'un navire. Je dois r�fl�chir aux possibilit�s.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Par contre abandonner mes hommes pour m'en tirer est absolument hors de question.

	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};

// ************************************************************
// 			  			Background
// ************************************************************
INSTANCE DIA_Lee_Background (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent   = FALSE;
	description = "Pourquoi voulez-vous tant regagner le continent ?";
};
FUNC INT DIA_Lee_Background_Condition()
{
	if (MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Background_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Pourquoi voulez-vous tant rejoindre le continent�?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Comme vous le savez, j'�tais autrefois g�n�ral dans l'arm�e du roi.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Mais les flagorneurs qui l'entourent m'ont trahi, car j'avais eu connaissance d'une chose que je n'aurais jamais d� apprendre.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Ils m'ont balanc� dans la colonie mini�re et le roi les a laiss�s faire.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //J'ai eu amplement le temps de r�fl�chir � la situation.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Je me vengerai�!
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(stup�fait) Du roi�?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(d�termin�) Du roi, oui, et de tout son entourage de flatteurs�! Ils regretteront am�rement ce qu'ils m'ont fait subir�!
};

// ************************************************************
// 			  		RescueGorn
// ************************************************************
INSTANCE DIA_Lee_RescueGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent   = FALSE;
	description = "Je vais me rendre dans la Vall�e des mines.";
};
FUNC INT DIA_Lee_RescueGorn_Condition()
{
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RescueGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Je vais me rendre � la Vall�e des mines.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Je me disais bien que vous ne resteriez pas longtemps ici.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //Si vous retournez � la colonie, essayez de retrouver Gorn. Les paladins le retiennent prisonnier.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn est un type bien qui me serait tr�s utile ici. Si vous avez l'occasion de le lib�rer, faites-le.
	
	KnowsAboutGorn = TRUE;
};
// ************************************************************
// 			 RescueGorn Success
// ************************************************************
INSTANCE DIA_Lee_Success (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent   = FALSE;
	description = "J'ai lib�r� Gorn.";
};
FUNC INT DIA_Lee_Success_Condition()
{
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel >= 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Success_Info()
{
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //J'ai lib�r� Gorn.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Je sais, il me l'a dit lui-m�me. Beau travail�!
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //A lui seul, il a plus de valeur pour moi que Sylvio et tous ses hommes.
	
	B_GivePlayerXP (XP_Ambient);
	
};
// ************************************************************
// 			  				AboutGorn
// ************************************************************
INSTANCE DIA_Lee_AboutGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent   = FALSE;
	description = "Gorn vous a parl� de moi ?? Que lui est-il arriv� ?";
};
FUNC INT DIA_Lee_AboutGorn_Condition()
{
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (other,DIA_Lee_RescueGorn) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AboutGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Gorn vous a parl� de moi�? Que lui est-il arriv�?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Vous vous souvenez de lui, n'est-ce pas�?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Laissez-moi r�fl�chir...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Bien s�r.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Bien s�r.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Il a �t� attrap� par les paladins qui l'ont envoy� � la Vall�e des mines dans un convoi de prisonniers.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Si la route de la Vall�e ne grouillait pas de paladins et d'orques, j'aurais envoy� plusieurs de mes hommes le lib�rer.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Mais la tentative aurait �t� vou�e � l'�chec. Pauvre bougre...
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Laissez-moi r�fl�chir...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Grand, brun, m�chant et arm� d'une grande hache. Il a repris notre mine en votre compagnie � la colonie.
};

// ************************************************************
// 			  				WegenBullco
// ************************************************************
INSTANCE DIA_Lee_WegenBullco (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent   = FALSE;
	description = "Gr�ce � Bullco, Onar a quelques moutons en moins...";
};
FUNC INT DIA_Lee_WegenBullco_Condition()
{
	if (Kapitel < 4) 
	&& (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (Onar_WegenPepe == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WegenBullco_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Onar a quelques moutons de moins que Bullco, d�sormais.
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //Vous voulez bien arr�ter avec ces broutilles�? Comme si je n'avais pas assez d'ennuis comme �a�!
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Vous n'�tes pas le seul. Bullco semble avoir un probl�me avec moi. Il veut que je quitte la ferme.
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //Et alors�? Affirmez-vous�!
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //Dites-lui qu'il se calme un peu s'il ne veut pas que je d�duise les moutons manquants de sa paye.
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

// ************************************************************
// 							Drachen Report
// ************************************************************
instance DIA_Lee_Report (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Report_Condition;
	information	= DIA_Lee_Report_Info;
	permanent	= TRUE;
	description = "Je reviens de la Vall�e des mines...";
};                       
FUNC INT DIA_Lee_Report_Condition()
{
	if (EnterOW_Kapitel2 == TRUE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Report_Info()
{	
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Je reviens de la Vall�e des mines. Le ch�teau a �t� attaqu� par des dragons !
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //C'est donc vrai�! Lares m'a dit que des rumeurs sur la pr�sence de dragons circulaient en ville, mais je ne l'ai pas cru.
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Et les paladins�?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Ils se sont fait d�cimer.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //Bien. Peut-�tre que cela incitera le seigneur Hagen � r�fl�chir de nouveau � ma proposition.
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //Et sinon... (durement) nous trouverons bien un autre moyen de partir d'ici.
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //Bien. Peut-�tre que cela incitera le seigneur Hagen � se rendre dans la Vall�e des mines avec ses hommes.
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Moins il y aura de paladins ici, mieux nous nous sentirons.
	};
};

// ************************************************************
// 							Armor M freischalten
// ************************************************************

var int Lee_Give_Sld_M;
// -----------------------

instance DIA_Lee_ArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorM_Condition;
	information	= DIA_Lee_ArmorM_Info;
	permanent	= TRUE;
	description = "Et pour une meilleure armure ?";
};                       
FUNC INT DIA_Lee_ArmorM_Condition()
{
	if (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	&& (Lee_Give_Sld_M == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Je pourrais avoir une meilleure armure�?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Vous avez rempli votre mission.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //J'ai une meilleure armure pour vous ici-m�me, mais il va falloir la m�riter.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof s'est vu confier une mission par Onar et il aurait d� s'en charger il y a longtemps.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Faites-le � sa place et nous reparlerons de votre armure.
	};
};

// ************************************************************
// 							Armor M kaufen
// ************************************************************
var int Lee_SldMGiven;
// -------------------

instance DIA_Lee_BuyArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorM_Condition;
	information	= DIA_Lee_BuyArmorM_Info;
	permanent	= TRUE;
	description = "Armure moyenne de mercenaire. Prot. : Armes 45, Fl�ches 45. Co�t : 500 po";
};                       
FUNC INT DIA_Lee_BuyArmorM_Condition()
{
	if (Lee_Give_Sld_M == TRUE)
	&& (Lee_SldMGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Donnez-moi l'armure.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Tenez, elle est de bonne qualit�.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Mais ce n'est pas un cadeau�! D'abord faites voir votre or.
	};
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

INSTANCE DIA_Lee_KAP3_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP3_EXIT_Condition;
	information	= DIA_Lee_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				  		Teleport
// ************************************************************

INSTANCE DIA_Lee_Teleport(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 1;
	condition	= DIA_Lee_Teleport_Condition;
	information	= DIA_Lee_Teleport_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lee_Teleport_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (Lee_Teleport == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Teleport_Info()
{	
	 B_Lee_Teleport();
};

// ************************************************************
// 							Armor H freischalten
// ************************************************************

instance DIA_Lee_ArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorH_Condition;
	information	= DIA_Lee_ArmorH_Info;
	permanent	= FALSE;
	description = "Avez-vous une meilleure armure pour moi ?";
};                       
FUNC INT DIA_Lee_ArmorH_Condition()
{
	if (Kapitel == 3)
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Auriez-vous une meilleure armure pour moi�?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Oui.
};

// ************************************************************
// 							Armor H kaufen
// ************************************************************
var int Lee_SldHGiven;
// -------------------

instance DIA_Lee_BuyArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorH_Condition;
	information	= DIA_Lee_BuyArmorH_Info;
	permanent	= TRUE;
	description = "Armure lourde de mercenaire. Prot. : Armes 60, Fl�ches 60. Co�t : 1 000 po";
};                       
FUNC INT DIA_Lee_BuyArmorH_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_ArmorH))
	&& (Lee_SldHGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Donnez-moi l'armure lourde.
	
	if (B_GiveInvItems (other, self, itmi_gold, 2500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Tenez, c'est une tr�s bonne armure. D'ailleurs je porte la m�me.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Mais vous savez comment �a marche�: montrez-moi d'abord votre or.
	};
};


// ************************************************************
// 	Richter
// ************************************************************

INSTANCE DIA_Lee_Richter (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Richter_Condition;
	information	= DIA_Lee_Richter_Info;
	permanent	= FALSE;
	description = "Avez-vous une autre t�che � me confier ?";
};                       
FUNC INT DIA_Lee_Richter_Condition()
{
	if (Kapitel >= 3)
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	&& ((Npc_IsDead(Richter))== FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Richter_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Avez-vous autre chose � me faire faire�?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Vous n'en avez jamais assez, hein�? Vous avez d�j� eu bien assez d'ennuis comme �a. Qu'est-ce que vous voulez encore�?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Une nouvelle mission. Je suis un mercenaire, vous vous souvenez�?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //Tr�s bien, j'ai quelque chose � vous proposer, et je crois que cela vous ira comme un gant.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //J'ai un compte � r�gler avec le juge de la ville. J'aimerais bien m'en acquitter personnellement...
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //Mais les paladins ne me laisseront jamais approcher de chez lui.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Il va falloir faire preuve de tact, alors, �coutez-moi bien�: allez voir le juge et offrez-lui vos services.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Faites en sorte de gagner sa confiance en faisant son sale boulot, jusqu'au moment o� vous trouverez de quoi l'incriminer.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Ce fumier a tellement de coups tordus � son actif que cela ne devrait pas tarder.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Rapportez-moi quelque chose dont je pourrais me servir contre lui, afin que la milice l'envoie derri�re les barreaux jusqu'� la fin de ses jours.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //Mais ne le tuez surtout pas, ce serait un ch�timent trop doux pour lui. Je veux qu'il souffre, c'est compris�?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //Vous pensez en �tre capable�?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee veut que je trouve des preuves contre le juge de Khorinis. Pour cela, je dois lui offrir mes services et garder les yeux bien ouverts."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Je refuse de faire �a.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Pas de probl�me. Combien ?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Pas de probl�me. Qu'est-ce que j'y gagne�?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Votre r�compense sera fonction de ce que vous me ram�nerez, alors faites un effort.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Il est hors de question que je joue les larbins pour ce sale type�!
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //Ne le prenez donc pas ainsi. Auriez-vous oubli� que c'est lui qui vous a fait envoyer de l'autre c�t� de la Barri�re�?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Faites ce que bon vous semble. Je suis s�r que vous prendrez la bonne d�cision.
	Info_ClearChoices	(DIA_Lee_Richter);
};



// ************************************************************
// 	RichterBeweise
// ************************************************************

INSTANCE DIA_Lee_RichterBeweise (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_RichterBeweise_Condition;
	information	= DIA_Lee_RichterBeweise_Info;

	description = "J'ai d�couvert quelque chose pour incriminer le juge.";
};                       
FUNC INT DIA_Lee_RichterBeweise_Condition()
{
	if (Kapitel >= 3)
	&& (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_RichterKomproBrief_MIS))
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RichterBeweise_Info()
{	
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //J'ai d�couvert de quoi incriminer le juge.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Vraiment�? De quoi s'agit-il�?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Il a engag� des brutes pour tabasser le gouverneur de Khorinis.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Peu de temps apr�s, il a fait arr�ter les coupables et tout l'or que ces derniers avaient d�rob� au gouverneur a fini dans sa poche.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Je vous ai ramen� l'ordre �crit qu'il leur avait envoy�.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Montrez-le moi.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Enfin�! Voil� qui devrait suffire pour le faire payer. Vous m'impressionnez.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Je suis dispos� � d�bourser une belle somme pour �a. Tenez, voici votre r�compense.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //Mais n'en soufflez surtout mot � personne !
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //Excellent�! Mais ce n'est plus n�cessaire... le juge est mort.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Un cr�tin l'a tu�. Bah, cela me convient aussi apr�s tout...
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Voici quelques pi�ces d'or. Cette note ne vaut rien de plus d�sormais.
			CreateInvItems (self, ItMi_Gold, 50);									
			B_GiveInvItems (self, other, ItMi_Gold, 50);		
			MIS_Lee_JudgeRichter = LOG_FAILED;
			B_GivePlayerXP (XP_Ambient);			
		};
};

// ************************************************************
// 	  				   Was ist mit Bennet?
// ************************************************************

INSTANCE DIA_Lee_TalkAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_TalkAboutBennet_Condition;
	information	= DIA_Lee_TalkAboutBennet_Info;
	permanent	= FALSE;
	description = "Et en ce qui concerne Bennet ?";
};                       
FUNC INT DIA_Lee_TalkAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (KApitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_TalkAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //Et Bennet�?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Ainsi, vous en avez entendu parler�? Ces fumiers l'ont enferm� sans autre forme de proc�s.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Comme si je n'avais pas assez de probl�mes avec mes hommes. Voil� qu'il me faut aussi m'occuper des paladins, maintenant.
	};
};

//**************************************************************
//	Was willst du wegen Bennet unternehmen?
//**************************************************************

INSTANCE DIA_Lee_DoAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_DoAboutBennet_Condition;
	information	= DIA_Lee_DoAboutBennet_Info;
	permanent	= FALSE;
	description = "Qu'allez-vous faire au sujet de Bennet ?";
};                       
FUNC INT DIA_Lee_DoAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_TalkAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_DoAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Que comptez-vous faire au sujet de Bennet�?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Je ne sais pas encore. Quelques-uns de mes hommes aimeraient bien aller en ville pour donner une bonne le�on au seigneur Hagen.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Heureusement qu'ils ne sont pas assez nombreux pour pouvoir esp�rer monter une telle op�ration�! Et puis, ce n'est pas mon style.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //Avez-vous l'intention de rester ici et d'attendre que les choses se passent, alors�?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //Certainement pas�!
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Si je ne peux faire rapidement la preuve de l'innocence de Bennet, Lee ne sera pas responsable de ce qui se passera. Les siens n'h�siteront pas � attaquer la ville pour lib�rer Bennet par la force."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares est encore en ville, � essayer de trouver le moyen de faire sortir Bennet de prison.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //D'ici l�, je fais tout mon possible pour calmer mes hommes. J'esp�re juste que Lares fera vite.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //Ah, oui�! Avant que j'oublie... Buster souhaite vous parler, mais il ne m'a pas dit � quel sujet. Vous feriez sans doute bien d'aller le voir...
	};
};

//**************************************************************
//	Kann ich dir helfen?
//**************************************************************

INSTANCE DIA_Lee_CanHelpYou(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_CanHelpYou_Condition;
	information	= DIA_Lee_CanHelpYou_Info;
	permanent	= FALSE;
	description = "Puis-je vous aider pour cette affaire avec Bennet ?";
};                       
FUNC INT DIA_Lee_CanHelpYou_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_CanHelpYou_Info()
{	
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Puis-je vous �tre utile pour ce qui est de Bennet�?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Bien s�r. Tous les renseignements sont bons � prendre dans cette affaire, surtout si vous savez garder la t�te froide.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Innos sait que je suis entour� d'idiots et de va-t-en-guerre en ce moment...
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Allez en ville et essayez de trouver un moyen de tirer Bennet de l�.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Mais faites vite, je ne sais combien de temps je pourrai encore tenir mes hommes.
};

//**************************************************************
//	Gibts was neues wegen Bennet?
//**************************************************************

//----------------------------------
var int DIA_Lee_AnyNews_OneTime;
//----------------------------------

INSTANCE DIA_Lee_AnyNews(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_AnyNews_Condition;
	information	= DIA_Lee_AnyNews_Info;
	permanent	= TRUE;
	description = "Des nouvelles de Bennet ?";
};                       
FUNC INT DIA_Lee_AnyNews_Condition()
{
	if (MIS_RescueBennet != FALSE)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))
	&& (DIA_Lee_AnyNews_OneTime == FALSE) 	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Quelles sont les nouvelles au sujet de Bennet�?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Au moins, il ne semble pas garder de s�quelles de son passage en prison.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Beau travail.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Non, nous n'en savons pas encore assez.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info Sylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_SYLVIO		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	3;
	condition	 = 	DIA_Lee_SYLVIO_Condition;
	information	 = 	DIA_Lee_SYLVIO_Info;

	description	 = 	"Que s'est-il pass� entre-temps ?";
};

func int DIA_Lee_SYLVIO_Condition ()
{
	if (MIS_ReadyforChapter4 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Lee_SYLVIO_Info ()
{
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Que s'est-il pass� en mon absence�?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Ce fumier de Sylvio a entendu parler des dragons de la Vall�e des mines et depuis, c'est le chaos ici.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Il a essay� de convaincre les autres de le suivre jusqu'� la vall�e en leur promettant gloire et richesse.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //La plupart d'entre eux n'ont nullement l'intention de se faire tuer pour ses beaux yeux, mais quelques cr�tins se sont laiss�s convaincre par son boniment.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Au final, ils se sont mis en route apr�s s'�tre �quip�s aupr�s de Bennet.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(d�daigneux) Bah. Au moins, je suis heureux que Sylvio m'ait d�barrass� le plancher.
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

INSTANCE DIA_Lee_KAP4_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP4_EXIT_Condition;
	information	= DIA_Lee_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_CanTeach		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	10;
	condition	 = 	DIA_Lee_CanTeach_Condition;
	information	 = 	DIA_Lee_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Pouvez-vous m'entra�ner ?";
};
func int DIA_Lee_CanTeach_Condition ()
{	
	if Kapitel >= 4
	&& Lee_TeachPlayer == FALSE
	{
		return TRUE;
	};
};
func void DIA_Lee_CanTeach_Info ()
{
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Pouvez-vous m'entra�ner�?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Je peux vous montrer comment vous battre avec une arme � deux mains.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Mais je n'ai pas le temps de vous enseigner les bases.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Je vous prendrai en main d�s que vous aurez atteint un certain niveau de ma�trise. D'ici l�, il vous faudra vous trouver un autre mentor.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //J'ai entendu dire que vous �tiez fort, mais je parie que j'ai encore quelques petites choses � vous apprendre...
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee m'apprendra � manier des armes � deux mains.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Si vous le souhaitez, je peux vous donner des le�ons mais bien s�r ce ne sera pas gratuit.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Combien ?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1�000 pi�ces d'or et c'est d'accord.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"C'est trop cher pour moi.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"March� conclu. Voici votre or.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //C'est trop cher pour moi.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //R�fl�chissez-y. Les mentors de mon niveau ne courent pas les rues.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //March� conclu. Voici votre or.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //Tr�s bien. Je vous garantis que vous ne faites pas une mauvaise affaire.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee m'apprendra � manier des armes � deux mains.");
};
 
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Lee_Teach(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 10;
	condition	= DIA_Lee_Teach_Condition;
	information	= DIA_Lee_Teach_Info;
	permanent	= TRUE;
	description = "Commen�ons l�entra�nement.";
};                       

FUNC INT DIA_Lee_Teach_Condition()
{
	IF (Lee_Teachplayer == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Lee_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Commen�ons par l'entra�nement.
	
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);

};

FUNC VOID DIA_Lee_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_Teach);
};


FUNC VOID DIA_Lee_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Vous �tes d�sormais pass� ma�tre dans le combat avec une arme � deux mains.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Vous n'avez plus besoin de mentor.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

FUNC VOID DIA_Lee_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Vous �tes d�sormais pass� ma�tre dans le combat avec une arme � deux mains.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Vous n'avez plus besoin de mentor.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachenei
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DRACHENEI		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	4;
	condition	 = 	DIA_Lee_DRACHENEI_Condition;
	information	 = 	DIA_Lee_DRACHENEI_Info;

	description	 = 	"Les hommes-l�zard distribuent des �ufs de dragon dans tout le pays.";
};

func int DIA_Lee_DRACHENEI_Condition ()
{

	if (Npc_HasItems (other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Les hommes-l�zards dispersent des �ufs de dragon dans tout le pays.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //J'aurais d� m'en douter. Il est grand temps que nous filions d'ici.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //Que suis-je cens� en faire�?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Les briser, bien s�r�! Que voudriez-vous en faire�?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Les coquilles pourront peut-�tre servir � fabriquer des armures ou d'autres objets.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Elles ont l'air assez solides. Touchez-en un mot � Bennet.
		B_LogEntry (TOPIC_DRACHENEIER,"Lee n'a pas pu faire grand chose avec l'�uf de dragon. Il m'a envoy� voir Bennet le forgeron."); 
	};
};

//********************************************************************
//	Kap 4 Perm
//********************************************************************

INSTANCE DIA_Lee_KAP4_Perm(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 49;
	condition	= DIA_Lee_KAP4_Perm_Condition;
	information	= DIA_Lee_KAP4_Perm_Info;
	permanent	= TRUE;
	description = "Comment �a va � la ferme ?";
};                       
FUNC INT DIA_Lee_KAP4_Perm_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Comment �a va � la ferme�?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //Nous avons enfin la paix depuis que Sylvio est parti.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //Voil� qui a l'air positif.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Malheureusement, la quantit� de travail n'a pas diminu� et mes hommes grognent de plus en plus, car il leur faut d�sormais assumer les t�ches de ceux qui sont partis avec Sylvio.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Mais ne vous en faites pas pour cela, je m'en charge.
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

INSTANCE DIA_Lee_KAP5_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP5_EXIT_Condition;
	information	= DIA_Lee_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GetShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GetShip_Condition;
	information	 = 	DIA_Lee_GetShip_Info;
	
	description	 = 	"Savez-vous comment je pourrais monter � bord du navire des paladins ?";
};
func int DIA_Lee_GetShip_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{	
		return TRUE;
	};
};
func void DIA_Lee_GetShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Avez-vous une id�e de la meilleure fa�on de s'emparer du navire des paladins�?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //Pensez-vous que je serais encore ici si j'�tais capable de r�pondre � cette question par l'affirmative�? Ce navire est encore mieux gard� que ne l'�taient les transporteurs de minerai de l'ancien campement.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Il doit bien exister un moyen de monter � bord...
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Bien s�r�! �a, ce n'est pas dur.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Le juge est en notre pouvoir apr�s tout. Allez le trouver et obligez-le � vous r�diger une lettre vous autorisant � monter � bord.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee pense que le meilleur moyen d'aller � bord du navire des paladins est d'obtenir une lettre d'autorisation du juge. Mais il ne risque pas de m'en donner une de sa propre volont�.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Tenez, j'ai l� une fausse autorisation �crite. Montrez-la aux gardes et ils vous laisseront passer.
		
			B_LogEntry (TOPIC_Ship,"Ce vieux Lee. Il a fait faire une fausse lettre qui va me permettre de me rendre sur le navire des paladins.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Mais ce n'est que le d�but. Il vous faut un capitaine et un �quipage si vous voulez piloter le navire.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Il y a �norm�ment de points de d�tail � r�gler.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Qui dois-je engager pour mon �quipage ?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Connaissez-vous quelqu'un qui pourrait commander le navire ?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Connaissez-vous quelqu'un qui soit capable de piloter le navire�?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Pour autant que je sache, Torlof �tait autrefois marin. Si quelqu'un s'y conna�t ici, c'est bien lui.

	B_LogEntry (TOPIC_Captain,"Torlof est un vieux loup de mer, peut-�tre veut-il �tre mon capitaine.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Qui devrais-je engager pour constituer mon �quipage�?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //A vous de voir, mais personnellement, je ne prendrais que des hommes de confiance. En connaissez-vous suffisamment�?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //S'il vous faut un forgeron, je vous conseille d'aller voir Bennet. Vous n'en trouverez pas de meilleur.

	B_LogEntry (TOPIC_Crew,"Quant � mon �quipage, Lee n'a pas pu m'�tre d'un grand secours. Mais il m'a dit que je ne devrais engager que des hommes de confiance. Je dois �galement en parler � Bennet, il se pourrait qu'il soit int�ress�.");
};

func void DIA_Lee_GetShip_back ()
{
	Info_ClearChoices	(DIA_Lee_GetShip);
};

///////////////////////////////////////////////////////////////////////
//	GotRichtersPermissionForShip
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GotRichtersPermissionForShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GotRichtersPermissionForShip_Condition;
	information	 = 	DIA_Lee_GotRichtersPermissionForShip_Info;

	description	 = 	"L'autorisation �crite a r�solu le probl�me.";
};
func int DIA_Lee_GotRichtersPermissionForShip_Condition ()
{	
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)	
	{
		return TRUE;
	};
};
func void DIA_Lee_GotRichtersPermissionForShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //L'autorisation �crite a jou� son r�le�: le navire est � moi. Le juge s'est montr� on ne peut plus coop�ratif.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //Comme quoi vous avez bien fait de longuement l'humilier, ce fumier.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Ich will das Schiff klauen
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StealShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StealShip_Condition;
	information	 = 	DIA_Lee_StealShip_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Je veux voler le navire.";
};

func int DIA_Lee_StealShip_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)	//Joly: kein Richter Erpressen n�tig!
	{
		return TRUE;
	};	
};

func void DIA_Lee_StealShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //J'ai l'intention de m'emparer du navire.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //Et comment comptez-vous vous y prendre�?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //Ce sera du g�teau. Je vais l�-bas, je leur montre votre fausse autorisation et je pars avec le bateau.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Si vous le dites. Tenez, mais j'esp�re que vous savez ce que vous faites.
	
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
};

//Lee anheuern

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lee_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"M'accompagnerez-vous � bord du navire ?";
};
func int DIA_Lee_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lee_GetShip))
	{
		return TRUE;
	};
};
func void DIA_Lee_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Vous m'accompagnez�?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //Vous plaisantez�? Bien s�r que oui�! Et puis, j'ai quelques comptes � r�gler sur le continent...
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //Qui plus est, je peux vous �tre tr�s utile en vous apprenant � mieux combattre avec les armes � une ou deux mains.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee est impatient de revoir le continent. Il m'a offert son soutien. J'aurai du mal � trouver un meilleur ma�tre d'armes.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //L'�quipage est au complet pour le moment, mais je reviendrai vous voir si une place se lib�re.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Je vous ferai savoir si vous pouvez m'�tre utile.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Alors allez pr�parer vos affaires !",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //Allez faire votre paquetage.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Quoi�? Maintenant�?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Oui. J'ai la ferme intention de m'en aller d'ici. Si vous tenez � m'accompagner, rejoignez-moi au port, devant le navire.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //Cela fait longtemps que j'attends ce moment. Je serai l�.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	Lee_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
		
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

FUNC VOID DIA_Lee_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Si vous pouvez m'�tre d'une quelconque utilit�, je vous tiendrai au courant.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //J'imagine que vous savez ce que vous voulez, mais on n'a jamais assez de combattants de qualit� � ses c�t�s.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //(sourit) Sauf s'il s'agit de d�biles profonds comme Sylvio, bien s�r...

	Lee_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_LeaveMyShip_Condition;
	information	 = 	DIA_Lee_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Apr�s tout, je n'ai nul besoin de vous.";
};

func int DIA_Lee_LeaveMyShip_Condition ()
{	
	if (Lee_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Finalement, je n'ai pas besoin de vous.
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Comme vous voulez. Vous savez o� me trouver si vous changez d'avis.
	
	Lee_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};


///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StillNeedYou_Condition;
	information	 = 	DIA_Lee_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Apr�s tout, vous pouvez m'�tre utile.";
};
func int DIA_Lee_StillNeedYou_Condition ()
{	
	if ((Lee_IsOnBOard == LOG_OBSOLETE)		//Hier braucht man nat�rlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lee_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Finalement, j'ai besoin de vous.
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Je le savais�! Bien, je vous retrouve au bateau.
		
		Lee_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Allez vous faire voir�! D'abord, vous me dites de venir, et puis, vous m'annoncez que vous n'avez plus besoin de moi.
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //Trouvez-vous une autre poire�!
	
		AI_StopProcessInfos (self);
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


INSTANCE DIA_Lee_KAP6_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP6_EXIT_Condition;
	information	= DIA_Lee_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



































