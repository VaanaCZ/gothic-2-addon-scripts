///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap1
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap1_EXIT_Condition;
	information = DIA_Parlan_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// ***************
// B_Parlan_Hammer
// ***************

var int Parlan_Hammer; //damit es nur EINMAL kommt

func void B_Parlan_HAMMER()
{
	AI_Output (self, other, "DIA_Parlan_HAMMER_05_00"); //Chwileczkê, mój synu.
	AI_Output (self, other, "DIA_Parlan_HAMMER_05_01"); //Plotka g³osi, ¿e z sanktuarium skradziono bardzo cenny artefakt.
	AI_Output (self, other, "DIA_Parlan_HAMMER_05_02"); //Nie chcê wiedzieæ nic wiêcej na ten temat. Rozumiem, ¿e wkrótce wróci on na swoje dawne miejsce.
	
	Parlan_Hammer = TRUE;
};


// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Parlan_PMSchulden (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 1;
	condition   = DIA_Parlan_PMSchulden_Condition;
	information = DIA_Parlan_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Parlan_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Parlan_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Parlan_PMSchulden_Info()
{
					// ------ Hammer genommen ------
					if (Parlan_Hammer == FALSE)
					&& (Hammer_Taken == TRUE) 
					&& (other.guild == GIL_NOV)
					&& (Npc_IsDead (Garwig) == FALSE)
					{
						B_Parlan_HAMMER();
					};
	
	AI_Output (self, other, "DIA_Parlan_PMSchulden_05_00"); //Pogwa³ci³eœ zasady naszego zgromadzenia.

	if (B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Parlan_PMSchulden_05_01"); //Nie jest to twoje pierwsze wykroczenie.
		
		if (Parlan_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_02"); //Twe winy zostan¹ ci odpuszczone tylko wtedy, gdy ofiarujesz pokaŸny datek na rzecz klasztoru.
			AI_Output (other, self, "DIA_Parlan_PMAdd_15_00"); //Ile?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter);
		
			if (diff > 0)
			{
				Parlan_Schulden = Parlan_Schulden + (diff * 50);
			};
				
			if (Parlan_Schulden > 1000)	{	Parlan_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Parlan_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_03"); //Co ty sobie wyobra¿asz? Módl siê do Innosa, by przebaczy³ ci twe wystêpki.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Parlan_PMSchulden_05_04"); //Twoja sytuacja uleg³a zmianie.
		
		if (Parlan_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_05"); //Nie ma ju¿ œwiadków pope³nionego przez ciebie morderstwa.
		};
		
		if (Parlan_LastPetzCrime == CRIME_THEFT)
		|| ( (Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_06"); //Nikt nie chce zeznawaæ w sprawie pope³nionej przez ciebie kradzie¿y.
		};
		
		if (Parlan_LastPetzCrime == CRIME_ATTACK)
		|| ( (Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_07"); //Nie ma ju¿ nikogo, kto oskar¿a³by ciê o spowodowanie bójki.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_08"); //Wszystkie oskar¿enia wobec ciebie zosta³y wycofane.
		};
		
		AI_Output (self, other, "DIA_Parlan_PMSchulden_05_09"); //Mnie mo¿esz oszukaæ - ale Innos widzi wszystko!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_10"); //Grzechy zosta³y ci odpuszczone.
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_11"); //Nie zmarnuj tej szansy.
	
			Parlan_Schulden			= 0;
			Parlan_LastPetzCounter 	= 0;
			Parlan_LastPetzCrime	= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_12"); //Zap³acisz za swe grzechy - taka jest wola Innosa!
			B_Say_Gold (self, other, Parlan_Schulden);
			AI_Output (self, other, "DIA_Parlan_PMSchulden_05_13"); //Uwolnij siê od swych grzechów!
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Parlan_PMSchulden);
		Info_ClearChoices  	(DIA_Parlan_PETZMASTER);
		Info_AddChoice		(DIA_Parlan_PMSchulden,"Nie mam dostatecznie du¿o z³ota!",DIA_Parlan_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Parlan_PMSchulden,"Ile to mia³o byæ?",DIA_Parlan_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
		{
			Info_AddChoice 	(DIA_Parlan_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Parlan_PMSchulden_HowMuchAgain_15_00"); //Przypomnij mi, o jakiej sumie mówiliœmy.
	B_Say_Gold (self, other, Parlan_Schulden);

	Info_ClearChoices  	(DIA_Parlan_PMSchulden);
	Info_ClearChoices  	(DIA_Parlan_PETZMASTER);
	Info_AddChoice		(DIA_Parlan_PMSchulden,"Nie mam dostatecznie du¿o z³ota!",DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Parlan_PMSchulden,"Ile to mia³o byæ?",DIA_Parlan_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
	{
		Info_AddChoice 	(DIA_Parlan_PMSchulden,"Chcê zap³aciæ grzywnê!",DIA_Parlan_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Parlan_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Parlan_PETZMASTER   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 1;
	condition   = DIA_Parlan_PETZMASTER_Condition;
	information = DIA_Parlan_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Parlan_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parlan_PETZMASTER_Info()
{
					// ------ Hammer genommen ------
					if (Parlan_Hammer == FALSE)
					&& (Hammer_Taken == TRUE) 
					&& (other.guild == GIL_NOV)
					&& (Npc_IsDead (Garwig) == FALSE)
					{
						B_Parlan_HAMMER();
					};
	
	Parlan_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Parlan noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_00"); //Nie zamieniliœmy jeszcze ani s³owa, a ty ju¿ obarczy³eœ siê ciê¿arem winy!
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_01"); //Jesteœ winny najgorszej z mo¿liwych zbrodni! Morderstwa!
	
		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Parlan_Schulden = Parlan_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_02"); //A teraz masz na sumieniu jeszcze dodatkowe grzechy!
		};
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_03"); //Gdyby to zale¿a³o ode mnie, zosta³byœ potêpiony tu i teraz, morderco!
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_04"); //Jeœli jednak zap³acisz za swe czyny, mogê ciê rozgrzeszyæ..
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_05"); //Kradzie¿ to pogwa³cenie zasad klasztoru.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_06"); //Prócz tego z³ama³eœ jeszcze inne zasady.
		};
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_07"); //Te przestêpstwa musz¹ zostaæ ukarane. Takie jest prawo Innosa.
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_08"); //Przeka¿esz klasztorowi stosowny datek.
		
		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_09"); //Nie tolerujemy tu ¿adnych bójek. To naruszenie panuj¹cych w klasztorze zasad.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_10"); //Dlaczego zabijasz nasze owce?
		};
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_11"); //¯yjemy tu, przestrzegaj¹c okreœlonych zasad. Dotycz¹ one tak¿e ciebie.
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_12"); //Za swe zbrodnie musisz z³o¿yæ ofiarê na rzecz klasztoru.
		
		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Parlan_PETZMASTER_05_13"); //Zabi³eœ nasze owce. Musisz zap³aciæ odpowiedni¹ rekompensatê.
		
		
		Parlan_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Parlan_PETZMASTER_15_14"); //Ile?
	
	if (Parlan_Schulden > 1000)	{	Parlan_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Parlan_Schulden);
	
	Info_ClearChoices  	(DIA_Parlan_PMSchulden);
	Info_ClearChoices  	(DIA_Parlan_PETZMASTER);
	Info_AddChoice		(DIA_Parlan_PETZMASTER,"Nie mam dostatecznie du¿o z³ota!",DIA_Parlan_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
	{
		Info_AddChoice 	(DIA_Parlan_PETZMASTER,"Chcê zap³aciæ grzywnê!",DIA_Parlan_PETZMASTER_PayNow);
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Parlan_PETZMASTER_PayNow_15_00"); //Chcê zap³aciæ karê!
	B_GiveInvItems (other, self, itmi_gold, Parlan_Schulden);
	AI_Output (self, other, "DIA_Parlan_PETZMASTER_PayNow_05_01"); //Przyjmujê datek. Twoje wykroczenie zostaje ci wybaczone. Niech Innos obdarzy ciê m¹droœci¹, byœ wiêcej nie grzeszy³.

	B_GrantAbsolution (LOC_MONASTERY);
	
	Parlan_Schulden			= 0;
	Parlan_LastPetzCounter 	= 0;
	Parlan_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Parlan_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
	Info_ClearChoices  	(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Parlan_PETZMASTER_PayLater_15_00"); //Nie mam dostatecznie du¿o z³ota!
	AI_Output (self, other, "DIA_Parlan_PETZMASTER_PayLater_05_01"); //Trzeba by³o o tym pomyœleæ, zanim dopuœci³eœ siê owych wystêpków.
	AI_Output (self, other, "DIA_Parlan_PETZMASTER_PayLater_05_02"); //Mo¿e bêdzie to dla ciebie dobra nauczka. Pamiêtaj, jeœli nie bêdziesz pope³nia³ wykroczeñ, nie bêdziesz musia³ za nie p³aciæ.
	
	Parlan_LastPetzCounter 		= B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	Info_ClearChoices (DIA_Parlan_PMSchulden);
	Info_ClearChoices (DIA_Parlan_PETZMASTER);
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_WELCOME		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 =  1;
	condition	 = 	DIA_Parlan_WELCOME_Condition;
	information	 = 	DIA_Parlan_WELCOME_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Parlan_WELCOME_Condition ()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};

func void B_DIA_Parlan_WELCOME_GoForTribute ()
{
			AI_Output (self, other, "DIA_Parlan_WELCOME_05_09"); //Kiedy to ju¿ zrobisz, porozmawiamy na temat twojej pracy tu, w klasztorze.
};
func void B_DIA_Parlan_WELCOME_BringTribute2Gorax ()
{
			AI_Output (self, other, "DIA_Addon_Parlan_WELCOME_05_00"); //Swoj¹ ofiarê na rzecz klasztoru zanieœ jak najszybciej Goraksowi. On ju¿ zadba, aby trafi³a gdzie trzeba.
};

func void DIA_Parlan_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_00"); //Witaj nowicjuszu, mam na imiê Parlan.
	AI_Output (other, self, "DIA_Parlan_WELCOME_15_01"); //Ja jestem...
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_02"); //...NOWICJUSZEM. To, kim by³eœ wczeœniej, nie ma znaczenia. Teraz jesteœ s³ug¹ Innosa. Tylko to siê liczy.
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_03"); //Wraz ze wst¹pieniem do Bractwa Ognia twoje wczeœniejsze winy zostan¹ ci wybaczone.
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_04"); //Niech Innos b³ogos³awi i oczyœci grzechy tego, który wstêpuje doñ na s³u¿bê.
	AI_Output (other, self, "DIA_Parlan_WELCOME_15_05"); //Co teraz?
	AI_Output (self, other, "DIA_Parlan_WELCOME_05_06"); //Najpierw musisz wype³niæ zadania nowicjusza. Bêdziesz pracowa³ i s³u¿y³ klasztorowi.
	
	B_GrantAbsolution (LOC_ALL);
	Snd_Play ("LEVELUP");
	
		Log_CreateTopic (Topic_Gemeinschaft,LOG_MISSION);
		Log_SetTopicStatus (Topic_Gemeinschaft,LOG_RUNNING);
		B_LogEntry (Topic_Gemeinschaft, "Jako nowicjusz jestem zobowi¹zany s³u¿yæ spo³ecznoœci.");
	
	if (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)//ADDON
	{
		if (Liesel_Giveaway ==  FALSE)
		{
			AI_Output (self, other, "DIA_Parlan_WELCOME_05_07"); //Przedtem jednak zabierz swoj¹ owcê do Opolosa, on siê ni¹ zajmie.
		};
		if (DIA_Gorax_GOLD_perm == FALSE) 
		{
			AI_Output (self, other, "DIA_Parlan_WELCOME_05_08"); //Z³oto mo¿esz zanieœæ Goraxowi, naszemu ochmistrzowi. Znajdziesz go w winiarni.
			B_DIA_Parlan_WELCOME_GoForTribute ();		
		};
	}
	//ADDON>
	else
	{
		if (DIA_Gorax_GOLD_perm == FALSE) 
		{
			B_DIA_Parlan_WELCOME_BringTribute2Gorax ();
			B_DIA_Parlan_WELCOME_GoForTribute ();
		};		
	};
	//ADDON<
};

///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Auge		(C_INFO)
{
	npc		 	 = 	KDF_504_Parlan;
	nr			 =  2;
	condition	 = 	DIA_Parlan_Auge_Condition;
	information	 = 	DIA_Parlan_Auge_Info;
	permanent 	 =  FALSE; 
	description	 =  "Poszukujê Oka Innosa.";
};
func int DIA_Parlan_Auge_Condition ()
{	
	if  (Kapitel <= 2)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Auge_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Auge_15_00"); //Poszukujê Oka Innosa.
	AI_Output (self, other, "DIA_Parlan_Auge_05_01"); //Nie wiem, kto ci o nim powiedzia³, ale nikt nie ma dostêpu do boskiego artefaktu.
	AI_Output (other, self, "DIA_Parlan_Auge_15_02"); //Gdzie przechowywane jest Oko Innosa?
	AI_Output (self, other, "DIA_Parlan_Auge_05_03"); //Im mniej osób zna ten sekret, tym bezpieczniejsze jest Oko. Mo¿esz sobie oszczêdziæ wysi³ku - i tak go nie odnajdziesz.
};


///////////////////////////////////////////////////////////////////////
//	Info Amulett
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Amulett		(C_INFO)
{
	npc		 	 = 	KDF_504_Parlan;
	nr			 =  3;
	condition	 = 	DIA_Parlan_Amulett_Condition;
	information	 = 	DIA_Parlan_Amulett_Info;
	permanent 	 =  FALSE; 
	description	 =  "Powiedz mi coœ o Oku Innosa.";
};
func int DIA_Parlan_Amulett_Condition ()
{	
	if (Kapitel <= 2)
	&& Npc_KnowsInfo (other, DIA_Parlan_Auge)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Amulett_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Amulett_15_00"); //Powiedz mi coœ o Oku Innosa.
	AI_Output (self, other, "DIA_Parlan_Amulett_05_01"); //Dobrze. Oko Innosa zawiera w sobie cz¹stkê jego boskiej mocy. Tylko JEDEN wybrany s³uga Innosa mo¿e nosiæ ten amulet.
	AI_Output (self, other, "DIA_Parlan_Amulett_05_02"); //Zosta³ on stworzony, by ochroniæ nas przed mocami Z³a, kiedy nadejdzie w³aœciwy moment.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Hagen		(C_INFO)
{
	npc		 	 = 	KDF_504_Parlan;
	nr			 =  2;
	condition	 = 	DIA_Parlan_Hagen_Condition;
	information	 = 	DIA_Parlan_Hagen_Info;
	permanent 	 =  FALSE; 
	description	 =  "Muszê porozmawiaæ z dowódc¹ paladynów!";
};
func int DIA_Parlan_Hagen_Condition ()
{	
	if (Kapitel <= 2)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Hagen_15_00"); //Muszê porozmawiaæ z dowódc¹ paladynów!
	AI_Output (self, other, "DIA_Parlan_Hagen_05_01"); //Lord Hagen nie przyjmuje nowicjuszy, jedynie my, magowie, mamy prawo siê z nim widzieæ.
};
///////////////////////////////////////////////////////////////////////
//	Info WORK
/////////////////////////////////////////////////////////////////////// 
instance DIA_Parlan_WORK		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 =  2;
	condition	 = 	DIA_Parlan_WORK_Condition;
	information	 = 	DIA_Parlan_WORK_Info;
	permanent	 =  TRUE;
	description	 = 	"W jaki sposób móg³bym s³u¿yæ zgromadzeniu?";
};
//------------------------------------
var int DIA_Parlan_WORK_perm;
//------------------------------------
func int DIA_Parlan_WORK_Condition ()
{
	if  (Kapitel == 1)
	&&  (Npc_KnowsInfo(other,DIA_Parlan_KNOWSJUDGE) == FALSE) 
	&&  Npc_KnowsInfo (other,DIA_Parlan_WELCOME)
	&&  (DIA_Parlan_WORK_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlan_WORK_Info ()
{
	AI_Output			(other, self, "DIA_Parlan_WORK_15_00"); //W jaki sposób móg³bym s³u¿yæ zgromadzeniu?
	
	//HACK
	if (Liesel_Giveaway ==  FALSE)
	|| (DIA_Gorax_GOLD_perm == FALSE)
	{
		AI_Output (self, other, "DIA_Parlan_WELCOME_05_06"); //Najpierw musisz wype³niæ zadania nowicjusza. Bêdziesz pracowa³ i s³u¿y³ klasztorowi.
		
		if 	(Liesel_Giveaway ==  FALSE)
		{
			AI_Output (self, other, "DIA_Parlan_WELCOME_05_07"); //Przedtem jednak zabierz swoj¹ owcê do Opolosa, on siê ni¹ zajmie.
		};
		if  (DIA_Gorax_GOLD_perm == FALSE)
		{
				//ADDON>
				if (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)
				{
					B_DIA_Parlan_WELCOME_BringTribute2Gorax ();
					B_DIA_Parlan_WELCOME_GoForTribute ();
				}
				//ADDON<
				else
				{	
					AI_Output (self, other, "DIA_Parlan_WELCOME_05_08"); //Z³oto mo¿esz zanieœæ Goraxowi, naszemu ochmistrzowi. Znajdziesz go w winiarni.
					AI_Output (self, other, "DIA_Parlan_WELCOME_05_09"); //Kiedy to ju¿ zrobisz, porozmawiamy na temat twojej pracy tu, w klasztorze.
				};
		};
		
		AI_StopProcessInfos (self);
	}
	else if Wld_IsTime (22,00,07,30)
	{
		AI_Output (self, other, "DIA_Parlan_WORK_NIGHT_05_01"); //W tej chwili obowi¹zuje cisza nocna. Praca nowicjuszy zaczyna siê o œwicie, a koñczy o zmierzchu.
		AI_Output (self, other, "DIA_Parlan_WORK_NIGHT_05_02"); //Ty te¿ powinieneœ udaæ siê na spoczynek. Wróæ do mnie, kiedy rozpoczn¹ siê godziny pracy.
		
		AI_StopProcessInfos (self);
	} 
	else
	{
		AI_Output (self, other, "DIA_Parlan_WORK_05_03"); //Porozmawiaj z innymi magami, dostaniesz od nich zadania.
		AI_Output (self, other, "DIA_Parlan_WORK_05_04"); //Bêdê nadzorowa³ twoj¹ pracê. Kiedy wype³nisz wszystkie swoje obowi¹zki, otrzymasz pozwolenie na wejœcie do biblioteki, by studiowaæ s³owo Innosa.
		
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_RUNNING; 
		B_LogEntry (Topic_Gemeinschaft, "Jeœli wykonam wszystkie polecenia magów, bêdê móg³ korzystaæ z biblioteki.");
	
	};
};
///////////////////////////////////////////////////////////////////////
//	Missions Abfrage Stand der Dinge
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Stand		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	23;
	condition	 = 	DIA_Parlan_Stand_Condition;
	information	 = 	DIA_Parlan_Stand_Info;
	permanent	 =  TRUE;
	description	 = 	"Czy mogê skorzystaæ z biblioteki?";
};
func int DIA_Parlan_Stand_Condition ()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Stand_Info ()
{
	Kloster_Punkte = 0;
	
	AI_Output (other, self, "DIA_Parlan_Stand_15_00"); //Mogê skorzystaæ z biblioteki?
	
	if (MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_01"); //Uda³o ci siê zdobyæ ogniste pokrzywy dla Brata Neorasa.
		Kloster_Punkte = (Kloster_Punkte + 2);
	};
	if (MIS_Neorasrezept == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_02"); //Odnalaz³eœ receptury Brata Neorasa.
		Kloster_Punkte = (Kloster_Punkte + 2);
	};
	if (MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_03"); //Pozby³eœ siê czarnego wilka, który zagra¿a³ kaplicy.
		Kloster_Punkte = (Kloster_Punkte + 1);
	};
	if (MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_04"); //Znalaz³eœ czterech nowicjuszy, dziêki czemu mog³eœ posprz¹taæ komnaty.
		Kloster_Punkte = (Kloster_Punkte + 3);
	};
	if (MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_05"); //Sprawiedliwie rozdzieli³eœ jad³o miêdzy nowicjuszy, tak jak prosi³ ciê o to brat Gorax.
		Kloster_Punkte = (Kloster_Punkte + 1);
	}
	else if (MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_06"); //Gorax nie by³ z ciebie zadowolony, nie uda³o ci siê sprawiedliwie rozdzieliæ jedzenia.
	};	
	if (MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_07"); //Ku radoœci Goraxa sprzeda³eœ wino.
		Kloster_Punkte = (Kloster_Punkte + 1);
	}
	else if (MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_08"); //Nie mówmy ju¿ o tej sprawie z winem, tak chyba bêdzie najlepiej...
	};	
	
	if (Kloster_Punkte >= 8)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_09"); //Tak, wykona³eœ dostatecznie du¿o zadañ. Czas postudiowaæ nauki Innosa. Porozmawiaj proszê z Mistrzem Hyglasem, znajdziesz go w bibliotece.
		AI_Output (self, other, "DIA_Parlan_Stand_05_10"); //Przyjmij ten oto klucz.
		Parlan_Erlaubnis = TRUE;
		MIS_KlosterArbeit = LOG_SUCCESS;
		Wld_AssignRoomToGuild ("Kloster02",GIL_PUBLIC);
		B_GiveInvItems (self, other, ItKe_KlosterBibliothek,1);
		
		//laufende Arbeiten im Log verschwinden lassen
		if (MIS_NeorasPflanzen == LOG_RUNNING)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};
		if (MIS_Neorasrezept == LOG_RUNNING)
		{
			MIS_Neorasrezept = LOG_OBSOLETE;
		};
		if (MIS_IsgarothWolf == LOG_RUNNING)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};
		if (MIS_ParlanFegen == LOG_RUNNING)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};
		if (MIS_GoraxEssen == LOG_RUNNING)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};
		if (MIS_GoraxWein == LOG_RUNNING)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};
		if (MIS_MardukBeten == LOG_RUNNING)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};
		
		B_CheckLog();
		
	}
	else if (Kloster_Punkte >= 1)
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_11"); //Zaiste sporo siê napracowa³eœ, wci¹¿ jednak musisz s³u¿yæ zgromadzeniu.
	}
	else  //0 Punkte
	{
		AI_Output (self, other, "DIA_Parlan_Stand_05_12"); //Najpierw wype³nij obowi¹zki na rzecz zgromadzenia. Kiedy skoñczysz, wrócimy do tej rozmowy.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	10;
	condition	 = 	DIA_Parlan_Aufgabe_Condition;
	information	 = 	DIA_Parlan_Aufgabe_Info;
	permanent	 =  FALSE;
	description	 = 	"Czy masz dla mnie jakieœ zadanie?";
};

func int DIA_Parlan_Aufgabe_Condition ()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Aufgabe_15_00"); //Czy masz dla mnie jakieœ zadanie?
	AI_Output (self, other, "DIA_Parlan_Aufgabe_05_01"); //Hmmm... Tak, w rzeczy samej, jest coœ, co mo¿esz zrobiæ dla dobra zgromadzenia.
	AI_Output (self, other, "DIA_Parlan_Aufgabe_05_02"); //Komnatom nowicjuszy przyda³oby siê porz¹dne zamiatanie. Zajmij siê tym.
	AI_Output (other, self, "DIA_Parlan_Aufgabe_15_03"); //Przecie¿ to potrwa wieki...
	AI_Output (self, other, "DIA_Parlan_Aufgabe_05_04"); //Chyba wiêc najlepiej bêdzie zacz¹æ od razu, prawda?
	
	MIS_ParlanFegen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus (Topic_ParlanFegen,LOG_RUNNING);
	B_LogEntry 	(Topic_ParlanFegen,"Mistrz Parlan chce, abym posprz¹ta³ komnaty czterech nowicjuszy. To zajmie ca³e wieki."); 
};
///////////////////////////////////////////////////////////////////////
//	Info alle sind am Fegen 
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Fegen		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	3;
	condition	 = 	DIA_Parlan_Fegen_Condition;
	information	 = 	DIA_Parlan_Fegen_Info;
	permanent	 =  TRUE;
	description	 = 	"Jeœli chodzi o komnaty nowicjuszy...";
};
//------------------------------------
var int DIA_Parlan_Fegen_permanent; 
//------------------------------------
func int DIA_Parlan_Fegen_Condition ()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	&& (DIA_Parlan_Fegen_permanent == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlan_Fegen_Info ()
{
	AI_Output (other, self, "DIA_Parlan_Fegen_15_00"); //Jeœli chodzi o komnaty nowicjuszy...
	
	if (NOV_Helfer >= 4)
	{
		AI_Output (self, other, "DIA_Parlan_Fegen_05_01"); //Widzê, ¿e uda³o ci siê znaleŸæ czterech pomocników. Myœlê, ¿e teraz mog¹ wróciæ do swych obowi¹zków.
		AI_Output (self, other, "DIA_Parlan_Fegen_05_02"); //Dobra robota, nowicjuszu. Wype³ni³eœ powierzone ci przeze mnie zadanie.
		MIS_ParlanFegen = LOG_SUCCESS; 
		B_GivePlayerXP (XP_ParlanFegen);
		DIA_Parlan_Fegen_permanent = TRUE;
		
		B_StartOtherRoutine (Feger1,"START");
		B_StartOtherRoutine (Feger2,"START");
		B_StartOtherRoutine (Feger3,"START");
		B_StartOtherRoutine (Babo,"START");
	}
	else 
	{
		AI_Output (self, other, "DIA_Parlan_Fegen_05_03"); //Niew¹tpliwie zadanie to nie nale¿y do ³atwych, jednak z pomoc¹ Innosa dasz sobie radê.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info LEARN
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_LEARN		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	23;
	condition	 = 	DIA_Parlan_LEARN_Condition;
	information	 = 	DIA_Parlan_LEARN_Info;
	permanent	 =  FALSE;
	description	 = 	"Jak móg³bym siê nauczyæ sztuk magicznych?";
};

func int DIA_Parlan_LEARN_Condition ()
{
	if (Npc_KnowsInfo (hero,DIA_Parlan_Hagen))
	&& (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Parlan_LEARN_Info ()
{
	AI_Output (other, self, "DIA_Parlan_LEARN_15_00"); //Jak móg³bym siê nauczyæ sztuk magicznych?
	AI_Output (self, other, "DIA_Parlan_LEARN_05_01"); //Nie jesteœ tu, by uczyæ siê magii, lecz by s³u¿yæ Innosowi.
	AI_Output (self, other, "DIA_Parlan_LEARN_05_02"); //Mogê ci jednak pokazaæ, jak zwiêkszyæ swe magiczne moce.
	
	B_LogEntry (Topic_KlosterTeacher,"Mistrz Parlan mo¿e mi pomóc w doskonaleniu moich zdolnoœci magicznych.");
};
///////////////////////////////////////////////////////////////////////
//	Info KNOWSJUDGE
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_KNOWSJUDGE		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	23;
	condition	 = 	DIA_Parlan_KNOWSJUDGE_Condition;
	information	 = 	DIA_Parlan_KNOWSJUDGE_Info;
	permanent	 = 	FALSE;
	description	 = 	"Chcê siê poddaæ Próbie Ognia.";
};
func int DIA_Parlan_KNOWSJUDGE_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == TRUE)
	&& (Npc_KnowsInfo (hero, DIA_Pyrokar_FIRE) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlan_KNOWSJUDGE_Info ()
{
	AI_Output (other, self, "DIA_Parlan_KNOWSJUDGE_15_00"); //Chcê siê poddaæ Próbie Ognia.
	AI_Output (self, other, "DIA_Parlan_KNOWSJUDGE_05_01"); //Co...? Hm... Mówisz powa¿nie?
	AI_Output (other, self, "DIA_Parlan_KNOWSJUDGE_15_02"); //Nalegam.
	AI_Output (self, other, "DIA_Parlan_KNOWSJUDGE_05_03"); //Wyj¹tkowy z ciebie nowicjusz. W porz¹dku, jeœli mówisz powa¿nie, porozmawiaj z mistrzem Pyrokarem.
	
	B_LogEntry (TOPIC_FireContest,"Jeœli chcê siê podj¹æ Próby Ognia, powinienem porozmawiaæ z Mistrzem Pyrokarem.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH_MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr 			 =  10;
	condition	 = 	DIA_Parlan_TEACH_MANA_Condition;
	information	 = 	DIA_Parlan_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
};
func int DIA_Parlan_TEACH_MANA_Condition ()
{	
	if ((other.guild == GIL_KDF)
	|| (other.guild == GIL_PAL) 
	|| (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (hero,DIA_Parlan_LEARN))
	&& (Parlan_Sends == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Parlan_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Parlan_TEACH_MANA_15_00"); //Chcia³bym powiêkszyæ swoje magiczne zdolnoœci.
		
		Info_ClearChoices   (DIA_Parlan_TEACH_MANA);	
		Info_AddChoice 		(DIA_Parlan_TEACH_MANA,DIALOG_BACK,DIA_Parlan_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1		, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Parlan_TEACH_MANA_1);
		Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Parlan_TEACH_MANA_5);
};
FUNC VOID DIA_Parlan_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)  
	{
		AI_Output (self, other, "DIA_Parlan_TEACH_MANA_05_00"); //Twoja magiczna moc wzros³a. Wiêcej nie mogê ci ju¿ pomóc.
		AI_Output (self, other, "DIA_Parlan_TEACH_MANA_05_01"); //Jeœli pragniesz nauczyæ siê wiêcej, porozmawiaj z Pyrokarem.
		Parlan_Sends = TRUE;
	};
	
	Info_ClearChoices   (DIA_Parlan_TEACH_MANA);	
};
FUNC VOID DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_Parlan_TEACH_MANA);	
	Info_AddChoice 		(DIA_Parlan_TEACH_MANA,DIALOG_BACK,DIA_Parlan_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Parlan_TEACH_MANA_5);
};
FUNC VOID DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_Parlan_TEACH_MANA);	
	Info_AddChoice 		(DIA_Parlan_TEACH_MANA,DIALOG_BACK,DIA_Parlan_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice		(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Parlan_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info MAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_MAGE		(C_INFO)
{
	npc		 	 = 	KDF_504_Parlan;
	nr			 =  2;
	condition	 = 	DIA_Parlan_MAGE_Condition;
	information	 = 	DIA_Parlan_MAGE_Info;
	permanent 	 =  FALSE; 
	important 	 =  TRUE; 
};
func int DIA_Parlan_MAGE_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Parlan_MAGE_Info ()
{
	AI_Output (self, other, "DIA_Parlan_MAGE_05_00"); //Z³o¿y³eœ przysiêgê, Bracie. Witaj w naszych szeregach.
	AI_Output (self, other, "DIA_Parlan_MAGE_05_01"); //O krêgach magii opowiem ci, kiedy zdobêdziesz wiêksze doœwiadczenie.
	AI_Output (self, other, "DIA_Parlan_MAGE_05_02"); //WeŸ ten kamieñ runiczny, to znak twojej mocy.
	
	B_GiveInvItems (self, other, Itmi_RunebLank,1);
};
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_01
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE1		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	99;
	condition	 = 	DIA_Parlan_CIRCLE1_Condition;
	information	 = 	DIA_Parlan_CIRCLE1_Info;
	permanent	 = 	TRUE;
	description	 = 	"WprowadŸ mnie proszê do pierwszego krêgu magii.";
};
func int DIA_Parlan_CIRCLE1_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 0)
	{
		return TRUE;
	};
};
func void DIA_Parlan_CIRCLE1_Info ()
{
	AI_Output (other, self, "DIA_Parlan_TECH_CIRCLE1_15_00"); //WprowadŸ mnie proszê do pierwszego krêgu magii.
	
	if B_TeachMagicCircle (self, other, 1)
	{
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE1_05_01"); //Magia pierwszego krêgu pozwala na u¿ywanie stworzonych przez siebie run.
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE1_05_02"); //Mo¿esz nauczyæ siê magicznych formu³ i samemu tworzyæ runy.
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE1_05_03"); //Ka¿dy z nas specjalizuje siê w jakimœ rodzaju magii. Zastanów siê wiêc dok³adnie, który z nich wybierzesz dla siebie.
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_02
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE2		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	99;
	condition	 = 	DIA_Parlan_CIRCLE2_Condition;
	information	 = 	DIA_Parlan_CIRCLE2_Info;
	permanent	 = 	TRUE;
	description	 = 	"WprowadŸ mnie w tajniki drugiego krêgu magii.";
};
func int DIA_Parlan_CIRCLE2_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 1)
	{
		return TRUE;
	};
};
func void DIA_Parlan_CIRCLE2_Info ()
{
	AI_Output (other, self, "DIA_Parlan_TECH_CIRCLE2_15_00"); //WprowadŸ mnie w tajniki drugiego krêgu magii.
	
	if (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self, other, 2)
		{
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE2_05_01"); //Poznasz teraz drugi kr¹g i nauczysz siê pos³ugiwaæ jeszcze potê¿niejsz¹ magi¹.
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE2_05_02"); //Pamiêtaj jednak o spoczywaj¹cej na tobie odpowiedzialnoœci. Nie wobec mnie czy Pyrokara - wobec samego Innosa.
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE2_05_03"); //To on wskazuje kierunek, jednak twoje czyny kszta³tuj¹ œcie¿kê, po której st¹pasz.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE2_05_04"); //Nie nadszed³ jeszcze czas.
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_03
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE3		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	99;
	condition	 = 	DIA_Parlan_CIRCLE3_Condition;
	information	 = 	DIA_Parlan_CIRCLE3_Info;
	permanent	 = 	TRUE;
	description	 = 	"WprowadŸ mnie w tajniki trzeciego krêgu magii.";
};
func int DIA_Parlan_CIRCLE3_Condition ()
{	
	if  Npc_KnowsInfo (hero,DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 2)
	{
		return TRUE;
	};
};
func void DIA_Parlan_CIRCLE3_Info ()
{
	AI_Output (other, self, "DIA_Parlan_TECH_CIRCLE3_15_00"); //WprowadŸ mnie w tajniki trzeciego krêgu magii.
	
	if (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self, other, 3)
		{
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE3_05_01"); //Tak, najwy¿szy czas, byœ pozna³ trzeci kr¹g magii. Czekaj¹ na ciebie nowe zaklêcia.
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE3_05_02"); //Bêdziesz ich potrzebowa³. Z³o nie œpi, a jedynie potêga Innosa mo¿e je pokonaæ.
			AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE3_05_03"); //Przekaza³em ci ju¿ wiedzê z zakresu wszystkich krêgów, jakie znam. Jeœli pragniesz poznaæ magiê wy¿szych Krêgów, porozmawiaj z Karasem.
			
			B_LogEntry (Topic_KlosterTeacher,"Brat Parlan zapozna³ mnie z pierwszymi trzema krêgami. Dalsze postêpy mogê poczyniæ dziêki Bratu Karrasowi.");
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Parlan_TECH_CIRCLE3_05_04"); //Nie nadszed³ jeszcze czas na to, byœ móg³ wkroczyæ do trzeciego krêgu.
	};
};		
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_TEACH		(C_INFO)
{
	npc			 = 	KDF_504_Parlan;
	nr			 = 	3;
	condition	 = 	DIA_Parlan_TEACH_Condition;
	information	 = 	DIA_Parlan_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Nauczaj mnie (tworzenie run)";
};
func int DIA_Parlan_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Parlan_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	
	AI_Output (other, self, "DIA_Parlan_TEACH_15_00"); //Naucz mnie!
	
	Info_ClearChoices (DIA_Parlan_TEACH);
	Info_AddChoice (DIA_Parlan_TEACH,DIALOG_BACK,DIA_Parlan_TEACH_BACK);
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
	{
		Info_AddChoice 	  (DIA_Parlan_TEACH,B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightHeal)),DIA_Parlan_TEACH_LIGHT_HEAL);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_LIGHT] == FALSE)
	{
		Info_AddChoice 	  (DIA_Parlan_TEACH,B_BuildLearnString (NAME_SPL_LIGHT, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LIGHT)),DIA_Parlan_TEACH_LIGHT);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_Parlan_TEACH_WINDFIST);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_Sleep] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_Sleep, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Sleep)) ,DIA_Parlan_TEACH_Sleep);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MediumHeal)) ,DIA_Parlan_TEACH_MediumHeal);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_Fear] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_Fear, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Fear)) ,DIA_Parlan_TEACH_Fear);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
	&& (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE) 
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_DestroyUndead, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_DestroyUndead)) ,DIA_Parlan_TEACH_DestroyUndead);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
	&& (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Parlan_TEACH, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_FullHeal)) ,DIA_Parlan_TEACH_FullHeal);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Parlan_TEACH_05_01"); //W tej chwili nie nauczê ciê ¿adnych nowych formu³.
	};
};
FUNC VOID DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices (DIA_Parlan_TEACH);
};
FUNC VOID DIA_Parlan_TEACH_LIGHT_HEAL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightHeal);	
};
FUNC VOID DIA_Parlan_TEACH_LIGHT()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LIGHT);	
};
FUNC VOID DIA_Parlan_TEACH_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_Parlan_TEACH_Sleep()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Sleep);	
};
FUNC VOID DIA_Parlan_TEACH_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MediumHeal);	
};
FUNC VOID DIA_Parlan_TEACH_Fear()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Fear);	
};
FUNC VOID DIA_Parlan_TEACH_DestroyUndead()
{
	B_TeachPlayerTalentRunes (self, other, SPL_DestroyUndead);	
};
FUNC VOID DIA_Parlan_TEACH_FullHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FullHeal);	
};

//###########################################
//##
//##	Kapitel 2
//##
//###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap2_EXIT_Condition;
	information = DIA_Parlan_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//###########################################
//##
//##	Kapitel 3
//##
//###########################################

func void B_Parlan_Exit()
{
	AI_Output (self ,other,"DIA_Parlan_EXIT_05_00"); //Niech Innos ciê prowadzi.
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap3_EXIT_Condition;
	information = DIA_Parlan_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap3_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	||  (other.guild == GIL_NOV)
	||  (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info IAmParlan //Sprich nicht mit den Schmuddelnovizen ;-)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_IAmParlan   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 39;
	condition   = DIA_Parlan_IAmParlan_Condition;
	information = DIA_Parlan_IAmParlan_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Parlan_IAmParlan_Condition()
{
	if	( (Kapitel >= 3)  
	&&	  (Npc_IsInState (self, ZS_Talk))
	&&	 ((other.guild != GIL_NOV)
	&& 	  (other.guild != GIL_KDF)))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_IAmParlan_Info()
{
	if (other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Parlan_IAmParlan_05_00"); //Widzê, ¿e zdecydowa³eœ siê walczyæ po naszej stronie. Cieszy mnie to.
		AI_Output (self ,other,"DIA_Parlan_IAmParlan_05_01"); //Przyda nam siê ka¿da pomoc! Powinieneœ od razu udaæ siê do Marduka, to on przygotowuje paladynów do walki.
	}
	else
	{
		AI_Output (self ,other,"DIA_Parlan_IAmParlan_05_02"); //Nie wiem, kto ciê wpuœci³ do klasztoru. Jestem Parlan, opiekujê siê nowicjuszami.
		AI_Output (self ,other,"DIA_Parlan_IAmParlan_05_03"); //Nie ¿yczê sobie, by ktoœ odrywa³ ich od zajêæ, i drêczy³ niem¹drymi pytaniami, zrozumiano?
		
		Parlan_DontTalkToNovice = LOG_RUNNING;
			
		Info_ClearChoices (DIA_Parlan_IAmParlan);
		Info_AddChoice (DIA_Parlan_IAmParlan,"Bêdê robi³, co mi siê podoba.",DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice (DIA_Parlan_IAmParlan,"Jasne.",DIA_Parlan_IAmParlan_OK);
	};
	Wld_InsertItem (ItKe_KlosterBibliothek,"NW_MONASTERY_CORRIDOR_02"); 
};

FUNC VOID DIA_Parlan_IAmParlan_MyChoice ()
{
	AI_Output (other,self ,"DIA_Parlan_IAmParlan_MyChoice_15_00"); //Bêdê robi³, co mi siê podoba.
	AI_Output (self ,other,"DIA_Parlan_IAmParlan_MyChoice_05_01"); //Na pewno istnieje jakiœ powód, dla którego twa obecnoœæ jest tutaj tolerowana, ale pamiêtaj - wszystko ma swoje granice.
	AI_Output (self ,other,"DIA_Parlan_IAmParlan_MyChoice_05_02"); //Jeœli bêdziesz sprawia³ k³opoty, s³ono za to zap³acisz. Trzymaj siê z dala od nowicjuszy.
	 
	Info_ClearChoices (DIA_Parlan_IAmParlan);
};

FUNC VOID DIA_Parlan_IAmParlan_OK()
{
	AI_Output (other,self ,"DIA_Parlan_IAmParlan_OK_15_00"); //Rozumiem.
	AI_Output (self ,other,"DIA_Parlan_IAmParlan_OK_05_01"); //Mam tak¹ nadziejê.

	Info_ClearChoices (DIA_Parlan_IAmParlan);
};
///////////////////////////////////////////////////////////////////////
//	Schlüssel für Bibliothek
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Bibliothek   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 40;
	condition   = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Bibliothek_Info;
	permanent   = FALSE;
	description = "Czy masz dla mnie coœ jeszcze?";
};
FUNC INT DIA_Parlan_Bibliothek_Condition()
{
	if  (other.guild != GIL_KDF)
	&&  (Kapitel >=3)
	&&  (other.guild != GIL_SLD)
	&&  (other.guild != GIL_DJG)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Bibliothek_Info()
{
	AI_Output (other ,self,"DIA_Parlan_Bibliothek_15_00"); //Czy masz dla mnie coœ jeszcze?
	AI_Output (self ,other,"DIA_Parlan_Bibliothek_05_01"); //Tak. Jako cz³onek biblioteki posiadasz do niej klucz. W bibliotece znajdziesz Braci Karasa i Hyglasa.
	AI_Output (self ,other,"DIA_Parlan_Bibliothek_05_02"); //Jeœli chcesz, mo¿esz z nimi porozmawiaæ.
	
	if (other.guild != GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Parlan_DontDisturb_05_03"); //Tylko zostaw w spokoju nowicjuszy.
	};
	B_GiveInvItems (self,other,ItKe_KlosterBibliothek,1);
};
///////////////////////////////////////////////////////////////////////
//	Ich wiederhole mich nicht gern
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_DontDisturb   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 39;
	condition   = DIA_Parlan_DontDisturb_Condition;
	information = DIA_Parlan_DontDisturb_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Parlan_DontDisturb_Condition()
{
	if   (Parlan_DontTalkToNovice == LOG_SUCCESS)
	&& (B_GetGreatestPetzCrime(self) == CRIME_NONE)
	&&	 ((other.guild != GIL_PAL)
	||	  (other.guild != GIL_NOV)
	|| 	  (other.guild != GIL_KDF))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_DontDisturb_Info()
{
	AI_Output (self ,other,"DIA_Parlan_DontDisturb_05_00"); //Nie lubiê siê powtarzaæ, ale... zostaw nowicjuszy w spokoju.
	AI_Output (self ,other,"DIA_Parlan_DontDisturb_05_01"); //Maj¹ oczyszczaæ swe dusze przy pomocy ciê¿kiej fizycznej pracy, aby przygotowywaæ siê do ¿ycia w klasztorze.
	AI_Output (self ,other,"DIA_Parlan_DontDisturb_05_02"); //Nie bêdê tolerowa³ twoich dalszych wybryków.
	
	Parlan_DontTalkToNovice = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm Kap3
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap3U4U5_PERM   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 39;
	condition   = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent   = TRUE;
	description = "Gdzie znajdê...";
};
FUNC INT DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if (Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3_PERM_15_00"); //Gdzie znajdê...
	
	Info_ClearChoices (DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,DIALOG_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,"...koœció³?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,"...bibliotekê?",DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,"...kaplicê?",DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice (DIA_Parlan_Kap3U4U5_PERM,"...piwnice?",DIA_Parlan_Kap3U4U5_PERM_Cellar);
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices (DIA_Parlan_Kap3U4U5_PERM);
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00"); //...koœció³?
	//AI_Output (self ,other,"DIA_Parlan_Kap3U4U5_PERM_Church_05_01"); //Die Kirche ist das größte Gebäude im Kloster. Du kannst sie gar nicht übersehen.
	AI_Output (self, other, "DIA_Parlan_Add_05_00"); //Panie Wszechmog¹cy! Czy¿by Innos pozbawi³ ciê wzroku?
	AI_Output (self, other, "DIA_Parlan_Add_05_01"); //Gdzie tu jest koœció³? Hmmm... gdzie¿ on mo¿e byæ?
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00"); //...bibliotekê?
	//AI_Output (self ,other,"DIA_Parlan_Kap3U4U5_PERM_Library_05_01"); //Die Bibliothek ist am Ende des Säulenganges, direkt gegenüber der Kirche.
	AI_Output (self, other, "DIA_Parlan_Add_05_02"); //Biblioteka znajduje siê na koñcu kolumnady, na lewo. Dok³adnie po drugiej stronie koœcio³a.
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00"); //...kaplicê?
	//AI_Output (self ,other,"DIA_Parlan_Kap3U4U5_PERM_Chapel_05_01"); //Wenn du das Kloster betrittst, findest du die Kapelle auf der halben Höhe des linken Säulenganges.
	AI_Output (self, other, "DIA_Parlan_Add_05_03"); //Kaplica to sala znajduj¹ca siê mniej wiêcej w po³owie kolumnady po lewej stronie. Tam w³aœnie paladyni modl¹ siê do Innosa.
};

FUNC VOID DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output (other,self ,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00"); //...piwnice?
	//AI_Output (self ,other,"DIA_Parlan_Kap3U4U5_PERM_Cellar_05_01"); //Der Eingang in die Katakomben ist direkt gegenüber der Kapelle auf halber Höhe des Säulenganges.
	AI_Output (self, other, "DIA_Parlan_Add_05_04"); //Wejœcie do piwnic znajduje siê w po³owie kolumnady, po prawej stronie.
};


//###########################################
//##
//##	Kapitel 4
//##
//###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap4_EXIT_Condition;
	information = DIA_Parlan_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap4_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	||  (other.guild == GIL_NOV)
	||  (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	
	AI_StopProcessInfos (self);
};


//###########################################
//##
//##	Kapitel 5
//##
//###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parlan_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_504_Parlan;
	nr          = 999;
	condition   = DIA_Parlan_Kap5_EXIT_Condition;
	information = DIA_Parlan_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Parlan_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Parlan_Kap5_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	||  (other.guild == GIL_NOV)
	||  (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	
	AI_StopProcessInfos (self);
};












