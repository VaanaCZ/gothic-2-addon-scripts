// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_EXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_EXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos (self);

};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_FIRSTEXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_FIRSTEXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_StartOtherRoutine (Wulfgar,"START"); 
};




// ************************************************************
// 	  				   		Steckbrief
// ************************************************************
var int Andre_Steckbrief; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_Steckbrief()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Un de mes hommes m'a dit que les bandits faisaient circuler des avis de recherche avec votre visage dessus.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //Il m'a aussi dit que vous aviez ni� ce fait.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //Alors qu'est-ce que cela signifie ?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //J'ignore pourquoi ces types me recherchent.
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //J'esp�re pour vous que vous dites la v�rit�.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //Je ne peux engager dans la milice quelqu'un qui a un casier.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //La plupart de ces bandits sont d'anciens prisonniers de la colonie mini�re.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //J'esp�re que vous n'�tes pas de m�che avec ces coupeurs de gorge !
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //Le marchand Canthar �tait ici. Il a dit que vous �tiez un prisonnier �vad� de la colonie mini�re.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //J'ignore si c'est la v�rit� et je pr�f�re ne pas le savoir mais vous devez d'abord r�gler cette affaire.
	
	B_RemoveNpc (Sarah);
	
			
	B_StartOtherRoutine (Canthar,"MARKTSTAND");
	AI_Teleport (Canthar,"NW_CITY_SARAH");
					
	if (Canthar_Sperre == FALSE)
	&& (Canthar_Pay == FALSE)
	{
		Canthar_Sperre = TRUE; 
	};
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	
	Andre_CantharFalle = TRUE;
};

// ************************************************************
// 			Canthar Falle als INFO (niedrige Important)
// ************************************************************

INSTANCE DIA_Andre_CantharFalle (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 3;
	condition   = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_CantharFalle_Condition()
{
	if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	&& (Andre_CantharFalle == FALSE)
	{
		return TRUE;
	};
	
	if (Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE)
	{
		return TRUE;
	};
};

FUNC INT DIA_Andre_CantharFalle_Info()
{
	if (Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
	};
	
	if (Andre_CantharFalle == FALSE)
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	{
		B_Andre_CantharFalle();
	};
};

// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Andre_PMSchulden (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Andre_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Andre_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //Etes-vous venu payer votre amende ?

						
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};
						
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};

	if (B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //Je me demandais si vous oseriez venir ici !
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Apparemment, les charges contre vous se sont multipli�es !
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //Je vous avais pr�venu ! Maintenant l'amende que vous devez payer est beaucoup plus importante.
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //Combien ?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Andre_LastPetzCounter);
		
			if (diff > 0)
			{
				Andre_Schulden = Andre_Schulden + (diff * 50);
			};
		
			if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Andre_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //Vous m'avez vraiment d��u.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //J'ai de nouveaux �l�ments.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //Plus personne ne vous accuse de meurtre.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //Plus personne ne vous accuse de vol.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //Il n'y a plus personne pour t�moigner que vous avez particip� � une bagarre.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Apparemment, toutes les charges qui pesaient contre vous ont �t� lev�es.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //J'ignore ce qui s'est pass� mais je vous avertis : n'essayez pas de me duper.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //Quoi qu'il en soit j'ai d�cid� d'effacer vos dettes.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Faites-en sorte de ne plus vous attirer d'ennuis.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Que les choses soient claires. Vous devrez tout de m�me payer votre amende dans sa totalit�.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //Oui, qu'y a-t-il ?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Je n'ai pas assez d'or.",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"C'est combien d�j� ?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"Je veux payer l'amende !",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //C'�tait quoi le prix d�j� ?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Je n'ai pas assez d'or.",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"C'est combien d�j� ?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"Je veux payer l'amende !",DIA_Andre_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Andre_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Andre_PETZMASTER   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Andre_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Vous devez �tre cet individu qui provoque des troubles en ville.
	};
	
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};	
	
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};
	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //Il est bien que vous vous soyez pr�sent� devant moi avant que votre cas ne s'aggrave.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //Le meurtre est un crime s�rieux !
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //Sans parler des autres choses que vous avez faites.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //La garde a re�u l'ordre d'ex�cuter sur le champ tous les meurtriers.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //Et la plupart des citoyens ne peuvent tol�rer la pr�sence d'un meurtrier en ville !
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //Vous pendre ne m'int�resse pas. Nous sommes en guerre et nous avons besoin de chaque homme.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Mais il ne sera pas ais� de changer l'opinion que les gens ont de vous.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //Vous pourriez t�moigner de vos remords en payant une amende qui, naturellement, serait assez cons�quente.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //C'est bien que vous soyez venu ! Vous �tes accus� de vol ! Il y a des t�moins !
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //Je ne parlerai m�me pas des autres m�faits dont vous �tes coupable.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //Je ne peux tol�rer une telle attitude en ville !
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //Vous devez payer une amende pour vous faire pardonner.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //C'est une chose de se bagarrer contre la vermine du port...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //C'en est une autre de s'en prendre � des citoyens ou aux soldats du roi. Je dois vous tra�ner en justice.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //Et cette histoire de mouton n'arrange rien.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Si je vous laisse vous en tirer comme �a, bient�t tout le monde fera ce qui lui plaira.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //Vous paierez donc une amende appropri�e et nous oublierons tout �a.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //J'ai entendu dire que vous vous en preniez � nos moutons.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Vous vous rendez compte que je ne peux pas laisser passer �a.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //Vous allez devoir payer une compensation !
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //Combien ?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"Je n'ai pas assez d'or.",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"Je veux payer l'amende !",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //Je veux payer l'amende !
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Bien ! Je veillerai � ce que tout le monde en ville soit au courant, cela permettra d'am�liorer quelque peu votre r�putation.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //Je n'ai pas assez d'argent.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //Alors faites en sorte de trouver de l'or le plus vite possible.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //Je vous avertis : si vous aggravez votre culpabilit�, �a ira mal pour vous !
	
	Andre_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// *********************************************************
//							Hallo
// *********************************************************
instance DIA_Andre_Hallo		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Hallo_Condition;
	information	 = 	DIA_Andre_Hallo_Info;
	permanent 	 =  FALSE; 
	important    =  TRUE;
};
func int DIA_Andre_Hallo_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Qu'Innos soit avec vous �tranger ! Qu'est-ce qui vous am�ne ?
};



// *********************************************************
//					Nachricht f�r Lord Hagen
// *********************************************************
instance DIA_Andre_Message		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 1;
	condition	= DIA_Andre_Message_Condition;
	information	= DIA_Andre_Message_Info;
	permanent 	= FALSE; 
	description = "J'ai un important message pour le seigneur Hagen.";
};
func int DIA_Andre_Message_Condition ()
{
	if (Kapitel < 3)
	&& ((hero.guild == GIL_NONE)
	|| (hero.guild == GIL_NOV))
	{
		return TRUE;
	};	
};
func void DIA_Andre_Message_Info ()
{
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //J'ai un message important pour le seigneur Hagen.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //Eh bien, vous �tes en pr�sence d'un de ses hommes. De quoi s'agit-il ?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "Que je dois transmettre moi-m�me au seigneur Hagen.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "Les hordes d'orques sont men�es par des DRAGONS !", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "Cela concerne une relique sacr�e, l'�il d'Innos.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Le seigneur Hagen ne re�oit que les paladins et ceux qui sont au service des paladins.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Il n'est pas digne de lui de consacrer son temps � des gens de la pl�be.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //Cela concerne un artefact sacr�, l'�il d'Innos.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //L'�il d'Innos... jamais entendu parler. Mais cela ne veut pas dire grand-chose.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //S'il existe vraiment un artefact portant ce nom, seuls les plus hauts repr�sentants de notre ordre peuvent en savoir queqlque chose.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //C'est pourquoi je dois parler au seigneur Hagen.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Les hordes d'orques sont dirig�es par des DRA...
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //(il l'interrompt) Je SAIS que l'arm�e des orques ne fait que se renforcer.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //Ne me dites pas que c'est pour �a que vous voulez d�ranger le seigneur Hagen.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Il vous arracherait la t�te si vous lui faisiez perdre son temps avec de telles histoires.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //Je suis s�r que vous �tes assez malin pour vous en rendre compte.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //Alors, de quoi s'agit-il vraiment ?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //�a, je dois le dire au seigneur Hagen moi-m�me.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Comme vous voulez, mais sachez une chose :
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_Paladine		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_Paladine_Condition;
	information	 = 	DIA_Andre_Paladine_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Pourquoi �tes-vous en ville ?";	
};
func int DIA_Andre_Paladine_Condition ()
{	
	if (other.guild != GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Pourquoi �tes-vous en ville ?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //Les objectifs de notre mission sont secrets.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //La seule chose que je puisse vous dire c'est que les citoyens ne risquent rien.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //Inutile de vous inqui�ter.
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_PaladineAgain		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_PaladineAgain_Condition;
	information	 = 	DIA_Andre_PaladineAgain_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Pourquoi �tes-vous en ville ?";	
};
func int DIA_Andre_PaladineAgain_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_PaladineAgain_Info ()
{
	if Npc_KnowsInfo (other,DIA_Andre_Paladine)
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //Allez-vous me dire maintenant pourquoi les paladins sont � Khorinis ?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Pourquoi �tes-vous en ville ?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Maintenant vous �tes membre de la garde et donc sous l'autorit� des paladins.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //Je peux donc vous mettre dans la confidence.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //Nous sommes en mission pour le roi Rhobar. Avec l'effondrement de la Barri�re, les livraisons de minerai se sont interrompues.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Aussi nous venons chercher le minerai pour le ramener sur le continent. Avec ce minerai, nous allons forger de nouvelles armes et repousser les orques.
	
	KnowsPaladins_Ore = TRUE;
};
// *********************************************************
//						AskToJoin
// *********************************************************
instance DIA_Andre_AskToJoin		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_AskToJoin_Condition;
	information	= DIA_Andre_AskToJoin_Info;
	permanent 	= FALSE; 
	description = "Je veux servir avec les paladins !";
};
func int DIA_Andre_AskToJoin_Condition ()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Andre_AskToJoin_Info ()
{
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //Je veux m'engager aupr�s des paladins !

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Bien. Un homme capable me serait tr�s utile, quelle que soit la raison pour laquelle il se joint � nous.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Si vous vous mettez au service des paladins, je vous aiderai � obtenir une audience aupr�s du seigneur Hagen.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Une requ�te des plus honorables.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //Cependant, j'ai ordre de n'accepter de citoyens de la ville qu'au sein de la milice.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //Mon commandant craint que des espions ou des saboteurs ne s'infiltrent dans nos rangs.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //Il veut ainsi prendre le moins de risques possible.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Ainsi, vous devez donc d'abord devenir citoyen de la ville. Que cela vous paraisse cens� ou non importe peu. Les ordres sont les ordres.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Avant de pouvoir devenir membre de la garde, je dois �tre citoyen de la ville.");
};

// *********************************************************
//						About Miliz
// *********************************************************
instance DIA_Andre_AboutMiliz (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	5;
	condition	 = 	DIA_Andre_AboutMiliz_Condition;
	information	 = 	DIA_Andre_AboutMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"A quoi dois-je m'attendre avec la milice ?";
};

func int DIA_Andre_AboutMiliz_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_ABOUTMILIZ_Info ()
{
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //A quoi dois-je m'attendre avec la milice ?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Que les choses soient claires. Etre soldat de la milice signifie autre chose que de parader en ville dans un bel uniforme.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //C'est un travail difficile et il faut parfois se salir les mains. Une fois que vous serez l'un de nous, beaucoup de travail vous attendra.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Mais cela en vaut la peine. En plus de la paie, vous aurez peut-�tre l'occasion de devenir un guerrier saint d'Innos.
};
			
///////////////////////////////////////////////////////////////////////
//	Info MartinEmpfehlung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MartinEmpfehlung		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information	 = 	DIA_Addon_Andre_MartinEmpfehlung_Info;

	description	 = 	"J'ai une lettre de recommandation de votre ma�tre du cellier.";
};

func int DIA_Addon_Andre_MartinEmpfehlung_Condition ()
{
	if (Npc_HasItems (other,ItWr_Martin_MilizEmpfehlung_Addon))
	&& (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //J'ai une lettre de recommandation de votre ma�tre du cellier.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //(incr�dule) Quoi ? Faites voir.
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //(impressionn�) Et bien, que je sois� ! Cela a d� vous demander beaucoup d'efforts. Ce n'est pas chose facile que d'obtenir ceci de Martin.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //D'accord. Vous m'avez convaincu. Si Martin vous parraine, je vous accepte. Faites-moi savoir quand vous serez pr�t.
	Andre_Knows_MartinEmpfehlung = TRUE;
};

// *********************************************************
//						Alternative			//e2
// *********************************************************
instance DIA_Andre_Alternative (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_Alternative_Condition;
	information	= DIA_Andre_Alternative_Info;
	permanent 	= FALSE; 
	description = "N'y a-t-il pas un moyen plus rapide pour me joindre � vous ?";
};
func int DIA_Andre_Alternative_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Alternative_Info ()
{
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //Y a-t-il un moyen plus rapide de rejoindre vos rangs?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Hum (il marque un temps d'arr�t). Vous le voulez vraiment, hein ?
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Alors, �coutez. J'ai un probl�me. Si vous le r�solvez pour moi, je ferai en sorte que vous soyez accept� dans la milice.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Mais la chose la plus importante est : vous ne devez en souffler mot � quiconque.
	
	
};

// *********************************************************
//						GuildOfThieves			//e3
// *********************************************************
instance DIA_Andre_GuildOfThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_GuildOfThieves_Condition;
	information	= DIA_Andre_GuildOfThieves_Info;
	permanent 	= FALSE; 
	description = "Quel est votre probl�me ?";
};
func int DIA_Andre_GuildOfThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};
func void DIA_Andre_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //Quel est votre probl�me ?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //Il y a eu r�cemment un grand nombre de vols en ville. Pour l'instant, nous n'avons pu arr�ter personne, les voleurs sont trop malins.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //La vermine conna�t son affaire. Je suis persuad� que nous avons affaire � un gang organis�.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //Cela ne m'�tonnerait pas qu'il y ait une guilde des voleurs � Khorinis. D�busquez les chefs de ce gang.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Alors je ferai en sorte que vous soyez accept� dans la milice, que vous soyez ou non un citoyen.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //Mais vous ne devrez rien dire au sujet de notre accord.
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"Il y a un autre moyen d'�tre accept� par la garde de la ville. Il faut trouver et �liminer la guilde des voleurs de Khorinis.");
	
};

// *********************************************************
//						WhereThieves			//e4
// *********************************************************
instance DIA_Andre_WhereThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_WhereThieves_Condition;
	information	= DIA_Andre_WhereThieves_Info;
	permanent 	= FALSE; 
	description = "O� dois-je commencer mes recherches pour trouver les voleurs ?";
};
func int DIA_Andre_WhereThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhereThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //O� dois-je commencer mes recherches pour les voleurs ?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //Si je le savais, j'irai moi-m�me.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //Tout ce que je peux vous dire, c'est que nous avons r�cemment fouill� de fond en comble le quartier du port et que nous n'avons rien trouv�.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //Les gens l�-bas ne sont pas tr�s bavards. Particuli�rement si vous portez l'armure d'un paladin.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Mais vous �tes un �tranger, ils ne se m�fieront pas trop de vous.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //Vous pouvez commencer votre enqu�te au port. Mais soyez prudent. Si les gens de l�-bas se rendent compte que vous travaillez pour nous, vous n'obtiendrez rien d'eux !
	
	B_LogEntry (TOPIC_BecomeMIL,"Pour trouver la guilde des voleurs, je ferais bien d'aller �couter les ragots dans le quartier du port.");
};

// *********************************************************
//						WhatToDo			//e4
// *********************************************************
instance DIA_Andre_WhatToDo (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 3;
	condition	= DIA_Andre_WhatToDo_Condition;
	information	= DIA_Andre_WhatToDo_Info;
	permanent 	= FALSE; 
	description = "Que devrai-je faire une fois que j'aurai trouv� les voleurs ?";
};
func int DIA_Andre_WhatToDo_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhatToDo_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //Que dois-je faire une fois que j'aurai trouv� un des voleurs ?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //S'il s'agit d'un laquais ou de menu fretin, �vitez le combat.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Venez plut�t me voir pour me faire votre rapport. Je m'arrangerai pour que ces individus finissent derri�re les barreaux.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //La garde pourrait intervenir en cas de combat et vous n'auriez pas l'occasion de vous expliquer.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //De plus, il y a une prime pour chaque malfaiteur que vous mettrez derri�re les barreaux.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Cependant, si vous localisez le repaire de leurs chefs, vous ne pourrez certainement pas �viter le combat.
	
	B_LogEntry (TOPIC_BecomeMIL,"Si j�attrape un serviteur de la guilde des voleurs, je dois le conduire directement aupr�s du seigneur Andr�. Pour �liminer la guilde, je dois trouver le repaire des voleurs.");
};

// *********************************************************
//					Verbrecher ausliefern		//e4
// *********************************************************
	
instance DIA_Andre_Auslieferung		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	200;
	condition	 = 	DIA_Andre_Auslieferung_Condition;
	information	 = 	DIA_Andre_Auslieferung_Info;
	permanent    =  TRUE;
	description	 = 	"Je suis venu chercher la r�compense pour un criminel.";
};

func int DIA_Andre_Auslieferung_Condition ()
{	
	if (Rengaru_Ausgeliefert == FALSE)
	|| (Halvor_Ausgeliefert == FALSE)
	|| (Nagur_Ausgeliefert == FALSE)
	|| (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};	
};

func void DIA_Andre_Auslieferung_Info ()
{
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //Je viens chercher la r�compense pour la capture d'un criminel.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Je reviendrai plus tard (RETOUR)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru a vol� Jora.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor vend des marchandises vol�es.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur a tu� le messager de Baltram.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Canthar tente de se d�barrasser de Sarah !",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sarah vend des armes � Onar.",DIA_Andre_Auslieferung_Sarah);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{	
	//Rengaru in den Knast beamen
	AI_Teleport			(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengaru a vol� Jora. Il a essay� de d�guerpir mais je l'ai attrap�.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Bien, mes hommes l'ont d�j� embarqu�. Il ne volera plus personne d�sormais.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Voici votre argent.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE; 
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	B_StartOtherRoutine (Rengaru,"PRISON");	
};

func void DIA_Andre_Auslieferung_Halvor()
{
	//Halvor in den Knast beamen
	AI_Teleport			(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor est un receleur. Il revend les marchandises que les bandits volent aux marchands.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //Ainsi c'est lui qui est derri�re tout �a. Mes hommes vont l'arr�ter.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //Je doute qu'il continue � nous cr�er des ennuis. Je vais vous donner votre r�compense.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	//Nagur in den Knast beamen
	AI_Teleport			(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur a tu� le messager de Baltram. Il a tent� de m'engager comme nouveau messager pour intercepter la livraison d'Akil.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Cet individu aura la punition qu'il m�rite. Je vais le faire enfermer imm�diatement.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Tenez, prenez cette r�compense qui vous revient de droit.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE; 
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	//Canthar in den Knast beamen
	AI_Teleport			(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Le marchand Canthar essaie de se d�barrasser de Sarah !
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sarah ? La vendeuse d'armes de la place du march� ?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //Je devais glisser dans les poches de Sarah une lettre qui l'impliquait dans des ventes d'armes � Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Je vois. C'est avec joie que je vais payer la prime pour ce b�tard. C'est comme s'il �tait d�j� derri�re les barreaux.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Canthar,"KNAST"); 
	
	MIS_Canthars_KomproBrief  = LOG_FAILED;
	B_CheckLog ();
	
	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};
func void DIA_Andre_Auslieferung_Sarah()
{
	//Sarah in den Knast beamen
	AI_Teleport			(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	//Canthar zum markt beamen
	AI_Teleport			(Canthar,"NW_CITY_SARAH"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sarah vend des armes � Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sarah ? La marchande d'armes de la place du march� ? En avez-vous la preuve ?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //Elle a une lettre dans sa poche, qui d�taille ces transactions.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //Elle ne s'en tirera pas comme �a. Je vais la faire arr�ter.
	
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Sarah,"KNAST"); 
	
	B_StartOtherRoutine (Canthar,"MARKTSTAND"); 
	
	Sarah_Ausgeliefert = TRUE;
	
	MIS_Canthars_KomproBrief  = LOG_SUCCESS;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

// *********************************************************
//					Diebesgilde Running
// *********************************************************
	
instance DIA_Andre_DGRunning (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	4;
	condition	 = 	DIA_Andre_DGRunning_Condition;
	information	 = 	DIA_Andre_DGRunning_Info;
	permanent    =  TRUE;
	description	 = 	"Au sujet de la guilde des voleurs...";
};

func int DIA_Andre_DGRunning_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info ()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Au sujet de la guilde des voleurs...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //Vous pouvez oublier cette affaire. J'ai envoy� quelques hommes dans les �gouts.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //La guilde des voleurs n'est plus que de l'histoire ancienne.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		
		if (MIS_CassiaKelche == LOG_RUNNING)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if (MIS_RamirezSextant == LOG_RUNNING)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //Oui ?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "J'y travaille...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Je les ai tous d�busqu�s !", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "J'ai trouv� le repaire de la guilde des voleurs !", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //J'y travaille.
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //Tr�s bien. Je vous accorde encore un peu de temps pour remplir votre mission.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Bien ! Tenez moi inform�.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //J'ai d�couvert le repaire des voleurs.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //O� ?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //Dans les �gouts sous la ville.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //Quoi ? Nous avons scell� les �gouts...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //Il semble que cela ne les ai pas emp�ch�s de s'y r�pandre.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Avez-vous d�busqu� les criminels ?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //Je les ai tous d�busqu�s !
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Vous avez rendu un grand service � la ville.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Si un poste dans la milice vous int�resse toujours, faites-le moi savoir.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Vous avez r�ussi votre mission comme il se doit pour un serviteur d'Innos et un soldat du roi.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Vous avez droit � la prime pour ces bandits. Tenez, prenez-la.
	B_GiveInvItems (self, other, itmi_gold, (Kopfgeld*3));
	
	Info_ClearChoices(DIA_Andre_DGRunning);
};
	
// *********************************************************
//						JOIN Miliz			
// *********************************************************
instance DIA_Andre_JOIN	(C_INFO) 
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	100;
	condition	 = 	DIA_Andre_JOIN_Condition;
	information	 = 	DIA_Andre_JOIN_Info;
	permanent    =  TRUE;
	description	 = 	"Je suis pr�t � me joindre � la milice !";
};

func int DIA_Andre_JOIN_Condition ()
{
	if (hero.guild == GIL_NONE) 
	&& (Npc_KnowsInfo (other,  DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info ()
{
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //Je suis pr�t � m'engager dans la milice.
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Martin, le ma�tre du cellier, vous parraine et vous recommande. Cela me suffit.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Je respecterai ma parole et je vous accepte au sein de la milice bien que vous ne soyez pas citoyen de la ville.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //Mais n'en parlez � personne ! Moins on parlera de cette entorse au r�glement, moins j'aurai � m'en justifier.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //Ainsi vous �tes citoyen de Khorinis ?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //Le forgeron m'a pris comme apprenti.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad ? Je le connais. Il travaille avec nous. C'est un brave homme.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //Je suis l'apprenti de l'alchimiste !
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //Nous n'avons pas vraiment beaucoup d'�rudits dans la milice. Peut-�tre que vos connaissances pourront nous �tre utiles.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //Je ne connais pas bien cet alchimiste mais les gens disent que c'est un homme honorable.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Bosper m'a engag� comme apprenti !
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //Alors vous savez �galement ce qu'est la vie en pleine nature. Voil� qui est bien car la mission de la milice ne s'arr�te pas aux remparts de la ville.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Nous aurons certainement besoin de gens qui savent se d�brouiller en pleine nature.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //Et Bosper est un citoyen important de la ville.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //S'il se porte garant de vous, rien ne s'oppose � ce que vous int�griez la milice.
		
		// ------- Au�erdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //De plus, vous avez r�ussi � nous d�barrasser des bandits. Pour ce seul fait, j'aurais accept� votre candidature.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //Peut-�tre mais vous n'�tes toujours pas citoyen de la ville et j'ai des consignes.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //Vous pouvez vous joindre � nous si vous le d�sirez. Mais vous ne pourrez pas revenir sur votre d�cision.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Une fois que vous rev�tez l'armure de la milice, vous ne pouvez pas l'�ter aussi facilement et ne plus �tre l'un des n�tres.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Etes-vous pr�t � combattre � nos c�t�s pour Innos et pour le roi ?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Je n'en suis pas encore tr�s s�r...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"Je suis pr�t !",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //Je suis pr�t !
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //Alors qu'il en soit ainsi. Bienvenue dans la milice.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Voici votre armure.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Portez-la fi�rement et dignement.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Je n'en suis pas encore tout � fait s�r...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Tant que vous nourrissez des doutes, je ne peux vous accepter dans la milice.
	
	Info_ClearChoices (DIA_Andre_JOIN);
};
	
// *********************************************************
//					Endlich zu Lord Hagen?
// *********************************************************

instance DIA_Andre_LORDHAGEN		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_LORDHAGEN_Condition;
	information	 = 	DIA_Andre_LORDHAGEN_Info;
	permanent	 = 	FALSE;
	description	 = 	"Puis-je voir le seigneur Hagen maintenant ?";
};
func int DIA_Andre_LORDHAGEN_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_LORDHAGEN_Info ()
{
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Puis-je enfin voir le seigneur Hagen ?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Vous �tes d�sormais au service des paladins. Ils vous laisseront entrer. Mais vous avez int�r�t � avoir des choses importantes � lui dire.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //Ne vous inqui�tez pas pour �a...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Rappelez-vous que vous allez rencontrer le chef des paladins. Comportez-vous comme il convient. Vous repr�sentez non seulement vous, mais aussi toute la milice.
};
// *********************************************************
//				Waffe
// *********************************************************
instance DIA_Andre_Waffe		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Waffe_Condition;
	information	 = 	DIA_Andre_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"Aurai-je �galement une �p�e ?";
};
func int DIA_Andre_Waffe_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Aurai-je une arme �galement ?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Naturellement. C'est g�n�ralement Peck qui se charge de �a. Mais maintenant que j'y pense, cela fait quelque temps que je ne l'ai pas vu.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Trouvez o� il se cache et ramenez-le ici. Il vous donnera alors une arme.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //Et si vous voulez dormir, vous pouvez vous allonger sur un des lits dans le dortoir.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck se trouve quelque part en ville. Si je le ram�ne � la caserne, il me donnera une arme.");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_PECK		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_PECK_Condition;
	information	 = 	DIA_Andre_FOUND_PECK_Info;
	permanent	 =  FALSE;
	description	 = 	"J'ai r�ussi � d�busquer Peck.";
};

func int DIA_Andre_FOUND_PECK_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Peck_FOUND_PECK)
	&& (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_IsDead (Peck) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_PECK_Info ()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //J'ai r�ussi � d�busquer Peck.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Oui, il est d�j� de retour � son poste et a repris le travail. O� l'avez-vous trouv� ?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Il a crois� ma route...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"� l'int�rieur de la 'Lanterne rouge'...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //Je l'ai crois� en ville.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //Tr�s bien, alors allez le voir et prenez votre arme.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //Il �tait � la 'Lanterne rouge'.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //Ainsi il tra�ne avec les filles au lieu d'accomplir son devoir.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Je vais devoir lui en toucher deux mots.
	
	B_GivePlayerXP 		(XP_FoundPeck*2);
	MIS_Andre_Peck = LOG_SUCCESS;
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};




// ################################################
// ###											###
// 				_NACH_  MILIZ-AUFNAHME
// ###											###
// ################################################

FUNC VOID B_AndreSold ()
{
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Voici votre salaire.
	B_GiveInvItems (self, other, itmi_Gold, Andre_Sold); 
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIRSTMISSION		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIRSTMISSION_Condition;
	information	 = 	DIA_Andre_FIRSTMISSION_Info;
	permanent 	 =  FALSE; 
	description	 = 	"Avez-vous une mission � me confier ?";
};
func int DIA_Andre_FIRSTMISSION_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIRSTMISSION_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //Avez-vous une mission � me confier ?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //R�cemment, les ventes d'herbes des marais n'ont fait que cro�tre.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //Nous ne pouvons tol�rer ce trafic.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Sinon, tout le monde va se mettre � fumer et plus personne ne pourra travailler et encore moins manier une arme.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //Surtout que la possibilit� d'une attaque des orques ou des mercenaires se fait de plus en plus probable.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //Je soup�onne les mercenaires d'�tre derri�re tout �a. Je parierai que ce sont eux qui inondent la ville de cette substance.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //Que faut-il faire ?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, l'un de nos hommes, a entendu dire dans le pub du port, qu'une livraison d'herbes des marais �tait arriv�e quelque part dans le quartier du port.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Allez fouiner l�-bas et ramenez-moi cette livraison.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"Un paquet d'herbes des marais est arriv� au port. Mortis en a entendu parler dans ce pub. Je dois trouver ce paquet et le remettre au seigneur Andr�.");
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info FOUND_STUFF
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_STUFF		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_STUFF_Condition;
	information	 = 	DIA_Andre_FOUND_STUFF_Info;
	permanent	 =  TRUE;
	description	 = 	"Au sujet du paquet...";
};
func int DIA_Andre_FOUND_STUFF_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_STUFF_Info ()
{
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //Au sujet de la livraison...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //L'avez-vous trouv�e ?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Oui, le voici.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"Je l'ai jet� dans le port.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //Pas encore.
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //Oui, la voil�.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Beau travail. Nous allons la mettre en s�curit�.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //Je l'ai jet�e dans le bassin du port.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //Le principal est qu'elle ne puisse pas tomber entre de mauvaises mains.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP (XP_Warehouse_Super);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
};	
	

///////////////////////////////////////////////////////////////////////
//	Info FIND_DEALER
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIND_DEALER		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIND_DEALER_Condition;
	information	 = 	DIA_Andre_FIND_DEALER_Info;
	permanent	 =  FALSE;
	description	 = 	"Avez-vous un autre travail pour moi ?";
};

func int DIA_Andre_FIND_DEALER_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	&& (Npc_IsDead (Borka)== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIND_DEALER_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //Avez-vous un autre travail pour moi ?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //Vous avez d�barrass� la ville du paquet d'herbes des marais, tr�s bien.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //Mais j'aimerais que vous d�couvriez qui distribue cette substance � la population.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //Il doit s'agir de quelqu'un du quartier du port.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Si un individu �tranger � la ville venait r�guli�rement, il aurait �t� arr�t� depuis longtemps.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //Que dois-je faire exactement ?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Trouvez ce dealer et faites-en sorte qu'il vous vende des herbes. Ce ne sera pas facile mais c'est le seul moyen de le faire arr�ter.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Parlez � Mortis, il conna�t bien le quartier du port. Peut-�tre pourra-t-il vous aider.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"Je dois trouver le type qui vend de l'herbe des marais dans le quartier du port. Il faut le convaincre de m'en vendre. Mortis pourra m'aider.");
};
///////////////////////////////////////////////////////////////////////
//	Info REDLIGHT_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_REDLIGHT_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information	 = 	DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent	 =  TRUE;
	description	 = 	"A propos de cette herbe...";
};
func int DIA_Andre_REDLIGHT_SUCCESS_Condition ()
{
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_REDLIGHT_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //Au sujet des herbes...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //Je crains que d�sormais nous n'apprenions plus quoi que ce soit dans le quartier du port.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Plus depuis la mort de ce videur.
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Cette fille de la Lanterne Rouge, cette Nadja� elle est morte. Il doit s'agir d'un accident.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //Vous n'avez pas �t� assez discret.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //Je sais qui vend l'herbe en ville. C'est Borka, le videur de la Lanterne Rouge.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //Vraiment ? Avons-nous une preuve ?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Il m'en a vendu.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Tr�s bien, cela nous suffit. Je vais le faire arr�ter imm�diatement.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //� j'y travaille toujours.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Bien, rappelez-vous que vous devez faire affaire avec cet individu.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info HilfBauerLobart
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_HILFBAUERLOBART		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 =  3;
	condition	 = 	DIA_Andre_HILFBAUERLOBART_Condition;
	information	 = 	DIA_Andre_HILFBAUERLOBART_Info;
	description	 = 	"Avez-vous une autre mission � me confier ?";
};
func int DIA_Andre_HILFBAUERLOBART_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_HILFBAUERLOBART_Info ()
{
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //Avez-vous une autre mission pour moi ?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Lobart, le cultivateur de navets, a des probl�mes dans ses champs.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Si nous l'aidons, cela renforcera ses relations avec la ville. Allez le voir et voyez ce qui ne va pas.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andr� m'envoie � la ferme de Lobart. Je dois aider Lobart � remettre de l'ordre dans sa ferme."); 
	
	
	MIS_AndreHelpLobart = LOG_RUNNING;

	Wld_InsertNpc		(Lobarts_Giant_Bug1, 			"NW_FARM1_FIELD_06"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug2, 			"NW_FARM1_FIELD_06");
	
	Wld_InsertNpc		(Lobarts_Giant_Bug3, 			"NW_FARM1_FIELD_05"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug4, 			"NW_FARM1_FIELD_05"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug5, 			"NW_FARM1_FIELD_04"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug6, 			"NW_FARM1_FIELD_04"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug7, 			"NW_FARM1_FIELD_03"); 
	
	
	B_StartOtherRoutine (Vino,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer2,"BUGSTHERE");
	
	AI_StopProcessInfos (self);	
};

///////////////////////////////////////////////////////////////////////
//	Info LOBART_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_LOBART_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_LOBART_SUCCESS_Condition;
	information	 = 	DIA_Andre_LOBART_SUCCESS_Info;
	description	 = 	"J'ai aid� Lobart.";
};
func int DIA_Andre_LOBART_SUCCESS_Condition ()
{	
	if (MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_LOBART_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //J'ai aid� Lobart.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Excellent. Si Lobart est content, il continuera � nous vendre des navets.
	B_GivePlayerXP (XP_LobartBugs);
	B_AndreSold ();
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople		(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople_Condition;
	information	= DIA_Addon_Andre_MissingPeople_Info;

	description	= "Qu'en est-il des disparitions ?";
};
func int DIA_Addon_Andre_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //Qu'en est-il des disparitions ?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //Et bien quoi ?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Ne devrions-nous pas essayer de retrouver les disparus ?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Le seigneur Hagen m'a donn� l'ordre de prot�ger la ville et les fermes alentours.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //Cela veut dire que nous prot�geons les gens qui sont encore ici.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //La milice fait des patrouilles de nuit. Je ne peux rien de plus.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //Et vous allez ob�ir aux ordres que je vous donne, compris ?
	
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople2	(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople2_Condition;
	information	= DIA_Addon_Andre_MissingPeople2_Info;

	description	= "A propos des disparus...";
};
func int DIA_Addon_Andre_MissingPeople2_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild != GIL_MIL)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //� propos des gens qui disparaissent
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //Fichez-moi la paix avec �a. J'ai d'autres soucis en t�te.
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_ReturnedMissingPeople		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Info;

	description	 = 	"J'ai r�ussi � sauver des disparus.";
};

func int DIA_Addon_Andre_ReturnedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	&& (MIS_Addon_Andre_MissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //J'ai r�ussi � sauver certains d'entre-eux.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //Nous y voil�. Moi qui me demandais o� vous aviez bien pu passer.
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //Vous �tes dans la milice. Vous n'aviez pas d'ordre pour ce type d'action !
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Mais
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //Combien de gens avez-vous trouv�s ?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //Tout ceux qui �taient encore en vie
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //Tous ?! Euh
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //Je suis tellement fier de vous ! Et je suis fier de vous avoir laiss� rejoindre nos rangs.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //Voil� une belle prouesse.

	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Andre_MissingPeople);
};



//##########################################
//##
//##	Kapitel 3
//##
//##########################################


func void B_Andre_GotoLordHagen()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //Vous feriez mieux d'aller le voir.
};

// *********************************************************
// 						BerichtDrachen
// *********************************************************

instance DIA_Andre_BerichtDrachen		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachen_Condition;
	information	 = 	DIA_Andre_BerichtDrachen_Info;
	permanent	 =	FALSE;
	description	 = 	"Je suis all� dans la Vall�e des mines et j'ai vu des dragons !";
};
func int DIA_Andre_BerichtDrachen_Condition ()
{	
	if (EnterOW_Kapitel2 == TRUE)
	&& (MIS_OLDWORLD != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachen_Info ()
{
	//AI_Output (other, self,"DIA_Andre_Add_15_12"); //Lord Hagen hat mich auf eine Mission ins Minental geschickt! Ich soll direkt aufbrechen.
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //J'�tais dans la Vall�e des mines et j'ai vu des dragons !
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //J'ai une lettre du commandant Garond qui confirme mes dires.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //Cela va int�resser le seigneur Hagen !
	B_Andre_GotoLordHagen();
};

///////////////////////////////////////////////////////////////////////
//		Cornelius l�gt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_BennetInPrison		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_BennetInPrison_Condition;
	information	 = 	DIA_Andre_BennetInPrison_Info;
	permanent	 =	TRUE;
	description	 = 	"Et qu'en est-il de Bennet, le forgeron ?";
};
func int DIA_Andre_BennetInPrison_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_BennetInPrison_Info ()
{
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //Et qu'en est-il de Bennet, le forgeron ?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //Vous voulez parler du mercenaire ? Il croupit en prison, ce qui est sa place.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Puis-je lui parler ?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Certainement, entrez. Mais si vous l'aidez � s'�chapper, vous subirez sa peine.
};

///////////////////////////////////////////////////////////////////////
//		Cornelius l�gt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_Cornelius_Liar		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Cornelius_Liar_Condition;
	information	 = 	DIA_Andre_Cornelius_Liar_Info;
	permanent	 =	TRUE;
	description	 = 	"Je crois que Corn�lius ment.";
};
func int DIA_Andre_Cornelius_Liar_Condition ()
{	
	if (Cornelius_ThreatenByMilSC == TRUE)
	&& (CorneliusFlee != TRUE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Cornelius_Liar_Info ()
{
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //Je crois que Corn�lius ment.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Vous en �tes s�r ?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Non.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Oui.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //Non.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //Alors vous ne devriez pas crier vos doutes sur les toits.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Corn�lius est un homme influent. Il peut faire de votre vie un v�ritable enfer s'il le souhaite.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Tant que vous n'avez pas de preuve, je ne peux pas vous aider.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Oui.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //Quelle preuve avez-vous ?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //J'ai lu son journal ! Ils l'ont corrompu. Tout �a n'�tait qu'un ramassis de mensonges.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Si c'est vraiment le cas, vous devez imm�diatement aller voir le seigneur Hagen.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Montrez-lui le journal. Il s'occupera du reste.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Hum, oui, je crois...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //J'ai besoin de preuves, pas de suppositions. Obtenez-moi une preuve et je pourrai faire quelque chose pour vous.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //En attendant, ne le dites pas � n'importe qui.
	};
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

// ******************************************************
//						Als Paladin
// ******************************************************

instance DIA_Andre_Paladin		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Paladin_Condition;
	information	 = 	DIA_Andre_Paladin_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};
func int DIA_Andre_Paladin_Condition ()
{	
	if (other.guild == GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladin_Info ()
{
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //Ainsi vous �tes d�sormais un paladin ! F�licitations !
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //D�s le d�but j'ai su que vous ne resteriez pas longtemps avec la milice.
};

// ******************************************************
//						PERM
// ******************************************************

instance DIA_Andre_PERM		(C_INFO)
{
	npc			 = Mil_311_Andre;
	nr 			 = 100;
	condition	 = DIA_Andre_PERM_Condition;
	information	 = DIA_Andre_PERM_Info;
	permanent	 = TRUE;
	description	 = "Quelle est la situation en ville ?";
};
func int DIA_Andre_PERM_Condition ()
{	
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_PERM_Info ()
{
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //Comment �a va en ville ?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //Tout est sous contr�le.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Accomplissez votre mission.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //A partir de maintenant, vous ferez vos rapports directement au seigneur Hagen. Allez lui parler.
	};
};


// ###################
//		  Kap 5
// ###################

// *********************************************************
// 						BerichtDrachenTot
// *********************************************************

instance DIA_Andre_BerichtDrachenTot		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachenTot_Condition;
	information	 = 	DIA_Andre_BerichtDrachenTot_Info;
	permanent	 =	FALSE;
	description	 = 	"J'ai tu� tous les dragons de la Vall�e des mines !";
};
func int DIA_Andre_BerichtDrachenTot_Condition ()
{	
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachenTot_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //J'ai tu� tous les dragons de la Vall�e des mines !
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Si c'est vrai, vous devez le dire au seigneur Hagen.
	B_Andre_GotoLordHagen();
};

// *********************************************************
// 						BerichtTorAuf
// *********************************************************

instance DIA_Andre_BerichtTorAuf (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtTorAuf_Condition;
	information	 = 	DIA_Andre_BerichtTorAuf_Info;
	permanent	 =	FALSE;
	description	 = 	"Le ch�teau de la Vall�e des mines a �t� attaqu� par les orques !";
};
func int DIA_Andre_BerichtTorAuf_Condition ()
{	
	if (Kapitel == 5)
	&& (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtTorAuf_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //Le ch�teau de la Vall�e des mines a �t� envahi par les orques !
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //Non ! Le seigneur Hagen doit �tre averti !
	B_Andre_GotoLordHagen();
};





















