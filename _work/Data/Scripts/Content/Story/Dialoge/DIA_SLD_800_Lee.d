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
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Hm. Dob�e �e jsi p�i�el.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Co se stalo?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Tohle jsem na�el ve star� kapli.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //Je to magick� runa. Mysl�m, �e t� teleportuje rovnou na farmu.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Napadlo m�, �e by se ti mohla hodit.
	
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
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //P�i�el jsi d�t Onarovi pen�ze?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //U� jsem ti ��kal, �e se nem� sna�it o ��dn� hlouposti.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar zjistil, �e sis zase stihl vylep�it z�znamy.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Bude teda po tob� cht�t taky v�c pen�z.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //Kolik?
			
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
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Myslel jsem si o tob�, �e jsi chyt�ej��.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //V tom p��pad� pro tebe m�m dobr� zpr�vy.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //U� nen� nikdo, kdo by tvrdil, �e t� vid�l sp�chat vra�du.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Nikdo u� nebude sv�d�it, �e t� vid�l kr�st.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //U� nen� nikdo, kdo by VID�L, jak jsi zml�til jednoho z farm���.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Vypad� to, �e se v�echna obvin�n� proti tob� rozplynula jako p�ra nad hrncem.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //I takhle je mo�n� se vypo��d�vat s probl�my.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Tak nebo tak, platit u� nemus�.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //P��t� si ale d�vej pozor.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Jedno je jist�: tak jako tak mus� zaplatit pokutu v pln� v��i.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //No, tak�e co?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Nem�m dost pen�z!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Kolik �e to bylo?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Kolik �e to bylo?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Nem�m dost pen�z!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Kolik �e to bylo?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Lee_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //K�ho �erta - (p�ekvapen�) - to jsi TY, ten nov��ek, co jde z jednoho mal�ru do druh�ho?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Sly�el jsem do Gorna, �e jsi po��d na�ivu, ale �e p�ijde� sem... no...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Dob�e �e jsi za mnou p�i�el, ne� to za�alo b�t pro tebe je�t� hor��.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //�old�ci jsou tvrd� ho�i a farm��i tak� nejsou ��dn� o�ez�v�tka, ale chodit po okol� a zab�jet na potk�n�? To prost� nejde.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //A to nemluv�m o dal��ch pot��ch, do kter�ch ses dostal.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //M��u ti pomoct dostat se z t�hle �lamastyky s �ist�m �t�tem.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //Ale bude t� to n�co st�t. Onar je po��dn� lakomec, ale pokud se m� na celou v�c zapomenout, mus� to b�t ON, kdo p�imhou�� oko.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Dob�e �e jsi p�i�el. Sly�el jsem, �e jsi pr� n�co ukradl.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //A ml�til farm��e hlava nehlava.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //A KROM� TOHO je�t� zabil p�r ovc�.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //To tady prost� d�lat nem��e�. V takov�ch p��padech Onar po�aduje, abych s vin�kem z��toval.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //To znamen�, �e ty zaplat� a kapsu si namast� on. Na celou v�c se tak ale zapomene.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Kdy� se zaplete� do souboje s n�kter�m ze �oldn���, je to n�co jin�ho.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //Ale kdy� zml�t� farm��e, pob�� rovnou za Onarem. A ode m� se bude o�ek�vat, �e n�jak zakro��m.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Nemluv� o tom, �e je docela h�kliv� na to, kdy� mu n�kdo zab�j� ovce.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Bude� muset zaplatit pokutu. Onar si poka�d� shr�bne pen�ze do vlastn� kapsy - ale jinak ta v�c urovnat nejde.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf get�tet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar ode m� o�ek�v�, �e budu chr�nit jeho farmu. A to zahrnuje i jeho ovce.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Bude� mu muset zaplatit od�kodn�!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Kolik?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Nem�m dost pen�z!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Chci tu pokutu zaplatit!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //Dobr�! Dohl�dnu na to, aby Onar sv� pen�ze dostal. M��e� pova�ovat celou v�c za vy��zenou.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Nem�m dost pen�z!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //V tom p��pad� si je co nejrychleji se�e�.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Ale nemysli si, �e je m��e� ukr�st tady na farm�. Kdyby t� chytili, bylo by to pro tebe je�t� hor��.
	
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
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //K�ho �erta - (p�ekvapen�) - Co tady d�l�? Myslel jsem, �e jsi mrtv�!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Pro� si to mysl�?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn mi �ekl, �es to byl ty, kdo strhnul bari�ru.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Ano, byl jsem to j�.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //Nikdy bych ne�ekl, �e n�kdo m��e n�co takov�ho p�e��t. Co t� sem p�iv�d�? Nejsi tu jen tak pro nic za nic.
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
	description = "Mus�m nutn� hovo�it s paladiny ve m�st�...";
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
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Pot�ebuju si nutn� promluvit s paladiny z m�sta. M��e� mi pomoci n�jak se k nim dostat?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(ned�v��iv�) Co kuje� s paladiny?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //To je dlouh� p��b�h...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //J� m�m �as.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(povzdychne� si) Pos�l� m� Xardas. Chce, abych z�skal mocn� amulet, Innosovo oko.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Tak�e po��d je�t� dr�� s t�m nekromantem. Aha. A ten amulet maj� paladinov�?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //Pokud v�m, tak ano.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //M��u ti pomoct dostat se k paladin�m. Ale nejd��v se mus� st�t jedn�m z n�s.
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
	description = "Jak mi m��e� pomoct dostat se k paladin�m?";
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
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //Jak mi m��e� pomoct dostat se k paladin�m?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //V�� mi. M�m pl�n. Mysl�m, �e jsi na to ten prav�.
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //J� t� dostanu k paladin�m a ty mi na opl�tku prok�e� jednu slu�bi�ku. Nejd��v ale vstup do na�ich �ad!
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
	description = "Co p�esn� tady d�l�te?";
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
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Co p�esn� tady d�l�te?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Je to prost�: postar�m se o to, abychom se v�ichni dostali z tohohle ostrova pry�.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar si n�s najal, abychom chr�nili jeho farmu, a p�esn� to budeme d�lat.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Ale na�� odm�nou bude v�c ne� jen n� �old. T�m, �e pom�h�me farm���m, jsme m�stu p�eru�ili z�sobov�n�.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //A ��m m�� toho budou m�t paladinov� k j�dlu, t�m d��ve budou ochotni naslouchat, a� k nim p�ijdu s nab�dkou k p��m���.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //�koda �e ses ze v�ech mo�n�ch lid� spol�il zrovna s nimi.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //Jak bude ta tvoje nab�dka vypadat?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //V z�sad� se bude jednat o na�i milost a voln� pr�chod na pevninu. V�c se dozv�, a� p�ijde �as.
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
	description = "R�d bych se k v�m p�idal!";
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
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //R�d bych se k v�m p�idal!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Doufal jsem, �e to �ekne�! Ka�d� ruka je tady dobr�.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Ty �old�ci, co jsem najal posledn�, d�lali jenom trable!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //V z�sad� m��e� za��t okam�it�. No, je�t� tady je p�r v�c�, kter�mi mus� proj�t, ale nen� to nic zvl�tn�ho.
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
	description = "��m mus�m 'proj�t', ne� se k v�m budu moci p�idat?";
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
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //��m mus�m 'proj�t', ne� se k v�m budu moci p�idat?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Zam�stn�v� n�s Onar, zdej�� statk��. M��e� na farm� z�stat, jen kdy� to on schv�l�.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //A pak tady jsou na�i ho�i. Mohu t� p�ijmout jen v p��pad�, �e s t�m bude souhlasit v�t�ina �old�k�.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Ale necho� za Onarem, dokud to nebude jist�. Je to velmi popudliv� chlap�k.
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"M�m-li b�t p�ijat mezi �oldn��e, mus� mi m�j vstup do jejich �ad nejd��ve schv�lit Onar.");
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
	description = "Jak m�m �oldn��e p�esv�d�it, aby m� p�ijali?";
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
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Jak m�m �oldn��e p�esv�d�it, aby m� p�ijali?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //�ekl bych, �e t�m, �e se bude� chovat jako �oldn��.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Promluv si s Torlofem. V�t�inou post�v� venku p�ed domem. Ozkou�� si t�.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Pokud tou zkou�kou projde�, m�l by sis vyslou�it velkou ��st pot�ebn�ho respektu.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //�ekne ti v�echno ostatn�, co bys m�l v�d�t.
	
	B_LogEntry (TOPIC_BecomeSLD,"Aby m� �oldn��i p�ijali mezi sebe, mus�m podstoupit zkou�ku, kterou mi zad� Torlof, a vyslou�it si respekt ostatn�ch.");
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

	description	 = 	"Co v� o 'kruhu vody'?";
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
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Co je ti zn�mo o kruhu vody?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(sm�je se) To jsem m�l v�d�t. Ty prost� mus� strkat nos do v�eho, co?
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //No tak, �ekni mi to.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Jsem do toho zapletenej jenom trochu. V�m, �e ten tajnej cech existuje a �e za n�m stoj� m�gov� vody.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Od p�du bari�ry u� m� ale k vodn�m m�g�m nepout� ��dn� smlouva jako tenkr�t.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Samoz�ejm� �e pom��u, kdy� to p�jde. Ale m�m tu dost vlastn�ch probl�m� a na ostatn� v�ci nem�m moc �as.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Jestli se o tom spolku chce� dozv�d�t v�c, promluv si s Cordem. Co j� v�m, tak pat�� k nim.
		
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
	description = "Jsem p�ipraven se k v�m p�idat!";
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
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Jsem p�ipraven se k v�m p�idat!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Ne, dokud neprojde� Torlofovou zkou�kou.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Tak co, pro�el jsi Torlofovou zkou�kou?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Ano.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //To je dob�e.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Co ��kaj� ostatn� �oldn��i?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Nev�m, jestli jich m�m na sv� stran� dostatek.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //V tom p��pad� si promluv s Torlofem, ten v� o v�em, co se tady na farm� �u�k�.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //V�t�ina z nich stoj� za mnou.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //Dobr�, v tom p��pad� b� za Onarem. U� jsem s n�m o tom mluvil.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //�old si ale mus� vysmlouvat s�m.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Te� u� pot�ebuji pouze Onar�v souhlas.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Byl jsi za Onarem?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Souhlasil.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //V�tej na palub�, chlap�e!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Tady, nejd��v si vezmi n�jak� po��dn� brn�n�!
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
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Jsem r�d, �e jsi mezi n�mi.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //Hned pro tebe m�m prvn� �kol.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //M� to co do �in�n� s paladiny. Je na�ase, aby ses za nimi vypravil.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //Stejn� jsi m�l v pl�nu tam j�t.
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
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Vid�m, �e ses dal do slu�by paladin�.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //Vstoupil jsi do kl�tera? (sm�je se) �ekal bych v�echno, ale tohle ne.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //No, te� u� se �oldn��em st�t nem��e�.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Ale kdo v�, mo�n� bys pro m� mohl jednu nebo dv� v�ci ud�lat - nebo j� pro tebe.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Uvid�me. Tak nebo tak, p�eji ti jen to nejlep��.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Ale nesna� se mi v�et bul�ky na nos, rozum�?
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
	description = "Jak se te� mohu dostat k paladin�m?";
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
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //Jak se te� mohu dostat k paladin�m?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //Jednodu�e. Donese� jim na�i nab�dku p��m���.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Lorda Hagena, velitele paladin�, zn�m z dob sv� slu�by v kr�lovsk� arm�d�.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //V�m, jak�m zp�sobem p�em��l� - nem� dostatek mu��. Tu nab�dku p�ijme. P�inejmen��m t� vyslechne.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Napsal jsem dopis - tady je.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //To by m�lo ka�dop�dn� sta�it, aby t� pustili k veliteli paladin�.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee m� pos�l�, abych lordu Hagenovi p�edal dar na usm��enou. Tak se mohu dostat mezi paladiny.");
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
	description = "Donesl jsem lordu Hagenovi tvoji nab�dku k m�ru.";
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
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Donesl jsem lordu Hagenovi tvoji nab�dku p��m���.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //Co ��kal?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //�ekl, �e tob� m��e zajistit prominut� tv�ch �in�, ale tv�m lidem ne.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Ten pali�at� bl�zen. V�t�ina mu�� v KR�LOVSK� arm�d� jsou v�t�� hrdlo�ezov� ne� moji chlapi.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Co bude� d�lat d�l?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Mus�m naj�t jin� zp�sob, jak n�s odsud dostat. Pokud to bude nutn�, ukradneme lo�. Budu si to muset promyslet.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //�e bych s�m vyt�hl krk z opr�tky a opustil sv� lidi, to v�bec nep�ipad� v �vahu.

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
	description = "Pro� tak stra�n� chce� na pevninu?";
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
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Pro� tak stra�n� chce� na pevninu?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Jak v�, slou�il jsem kr�li jako gener�l.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Ale jeho patol�zalov� m� zradili, proto�e jsem v�d�l n�co, co jsem v�d�t nem�l.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Vrazili m� do t� t�a�sk� kolonie a kr�l to nechal b�t.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //M�l jsem dost �asu, abych si to nechal proj�t hlavou.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Mus�m se pomst�t.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(ohromen�) Kr�li?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(rozhodn�) Kr�li! A v�em jeho pochlebn�k�m. Budou trpce litovat, co mi ud�lali.
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
	description = "Vyd�m se do Hornick�ho �dol�.";
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
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Vyd�m se do Hornick�ho �dol�.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Nemyslel jsem si, �e bys z�stal tady na farm� n�jak dlouho.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //Jestli p�jde� zp�tky do kolonie, zkus naj�t Gorna. Paladinov� ho dr�� jako v�zn�.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn je dobr� chlap�k a mn� by se tady hodil, tak�e kdybys m�l �anci ho osvobodit, tak v�bec nev�hej.
	
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
	description = "Osvobodil jsem Gorna.";
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
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //Osvobodil jsem Gorna.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Ano, u� mi to �ekl. Dobr� pr�ce.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Stoj� za v�c ne� Sylvio a jeho chlapci dohromady.
	
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
	description = "Gorn ti o mn� �ekl? Co se mu stalo?";
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
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Gorn ti o mn� �ekl?? Co se mu stalo?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Pamatuje� si ho, �e?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Nech m� h�dat...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Jasn�.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Jasn�.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Chytili ho paladinov� a poslali ho s kolonou trestanc� zp�tky do Hornick�ho �dol�.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Kdyby nebyla cesta do Hornick�ho �dol� pln� paladin� a sk�et�, d�vno bych tam poslal p�r sv�ch hoch�, aby ho osvobodili.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Ale proto�e to vypad� tak, jako to vypad�, nem�lo by to smysl. Chud�k.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Nech m� h�dat.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Velk�, tmav�, sprost�, s velkou sekerou - tenkr�t v kolonii spolu s tebou dobyl zp�tky n� rudn� d�l.
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
	description = "Onar te� m� d�ky Bullcovi o p�r ovc� m��...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Onar te� m� d�ky Bullcovi o p�r ovc� m��.
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //Ale no tak, necho� za mnou s takov�mi kravinami! U� takhle m�m starost� nad hlavu.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //J� taky. Zd� se, �e Bullco m� probl�my se mnou. Chce, abych opustil farmu.
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //No a? St�j si na sv�m.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //Mohl bys mu ��ct, aby se dr�el na uzd�, jinak mu ty ovce strhnu ze �oldu.
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
	description = "P�ich�z�m z Hornick�ho �dol�...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Vr�til jsem se z Hornick�ho �dol�. Na hrad za�to�ili draci!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //Tak�e to je pravda! Lares ��kal, �e po m�st� koluj� zpr�vy o drac�ch. Nem��u tomu uv��it...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Co paladinov�?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Jsou �pln� zdecimovan�.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //V�born�! Mo�n� by lord Hagen mohl znovu zv�it mou nab�dku.
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //A jestli ne... (ost�e) Pak najdeme jin� zp�sob, jak se odsud dostat.
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //V�born�! Mo�n� to lorda Hagena donut� p�esunout se do Hornick�ho �dol� se zbytkem sv�ch mu��.
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //��m m�� paladin� tady z�stane, t�m l�pe.
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
	description = "Co takhle n�jak� lep�� brn�n�?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Co takhle n�jak� lep�� brn�n�?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Splnil jsi sv�j �kol.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //M�m tady pro tebe n�jak� lep�� brn�n�. Tedy pokud m� hotovost.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof dostal od Onara �kol, o kter� se m�l u� p�ed �asem postarat.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Tak�e to nejd��v za�i� - pak si m��eme promluvit o lep��m brn�n�!
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
	description = "Koupit si st�edn� t�kou �oldn��skou zbroj. Ochrana: zbran� 45, ��py 45, cena 500 zla��k�.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Dej mi to brn�n�.
	
	if (B_GiveInvItems (other, self, itmi_gold, 500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Tady je. V�n� dobr� zbroj.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Ale nen� to ��dn� d�rek! Nejd��v chci vid�t zlato!
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
	description = "Nem�l bys pro m� n�jakou lep�� zbroj?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Nem�l bys pro m� n�jakou lep�� zbroj?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Samoz�ejm�.
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
	description = "Koupit t�kou �oldn��skou zbroj. Ochrana: zbran� 60, ��py 60, cena: 1000 zla��k�.";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Dej mi to t�k� brn�n�.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Tady je. Velice dobr� zbroj. Je stejn�, jakou m�m i j�.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //V�, jak to chod�. Nejd��v pen�ze!
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
	description = "Nem� pro m� nic dal��ho na pr�ci?";
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
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Nem� pro m� nic dal��ho na pr�ci?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Nikdy nem� dost, co? U� takhle m� probl�m� a� a�. Co dal��ho bys je�t� cht�l?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Dal�� �kol. Jsem �old�k, zapomn�ls?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //Dobr�. N�co by tu bylo. Je to p�esn� pro tebe.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Mus�m u jednoho soudce z m�sta vyrovnat dluh. R�d bych to samoz�ejm� vy��dil osobn�.
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //Ale paladinov� m� k jeho domu nepust� na vzd�lenost, co bys kamenem dohodil.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Celou z�le�itost mus� prov�st opatrn�. Tak�e d�vej pozor. P�jde� za soudcem a nab�dne� mu svoje slu�by.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Pokus se z�skat jeho d�v�ru a d�lej pro n�j �pinavou pr�ci, dokud na n�j n�co nenajde�.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Ta svin� u� ud�lala tolik pras�ren, �e se ten smrad line a� k nebes�m.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //P�ines mi n�co, s ��m bych mohl jeho jm�no po�pinit p�ed domobranou. Zbytek �ivota bude hn�t v base.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //Rozhodn� ale nechci, abys ho zabil. To by bylo p��li� rychl�. Chci, aby trp�l. Rozum�?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //Mysl�, �e to zvl�dne�?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee chce, abych na�el n�jak� inkriminuj�c� d�kaz proti khorinidsk�mu soudci. M�m mu proto nab�dnout sv� slu�by a p�itom m�t o�i na stopk�ch."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Nic takov�ho neud�l�m.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Bez probl�m�. Kolik?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Bez probl�m�. Kolik?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Tvoje odm�na z�vis� na tom, co mi donese�. Tak�e se sna�.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Tohle d�lat nebudu. Nebudu si hr�t p�ed tou svin� na n�jak�ho patol�zala.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //Jen se ne�erti. Ostatn�, byl to pr�v� on, kdo t� nechal zav��t a hodit skrz bari�ru. Nebo jsi na to snad u� zapomn�l?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //D�lej, co chce�, ale mysl�m, �e se nakonec rozhodne� spr�vn�.
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

	description = "Na�el jsem n�co na toho soudce.";
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
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Na�el jsem n�co na toho soudce.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //V�n�? A co?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Najal si p�r rana��, aby p�epadli m�stodr��c�ho Khorinidu.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Kr�tce pot� je nechal zatknout a s�m shr�bl pen�ze, kter� ukradli.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Jako d�kaz jsem ti p�inesl p��kaz, kter� soudce t�m rv���m dal.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Uka� mi ho.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Kone�n�. To by m�lo sta�it, aby trpce litoval. Ud�lal jsi na m� dojem.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Za tohle se r�d pl�cnu p�es kapsu. Tady je tvoje odm�na.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //A nikomu o tom ani muk, jasn�?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //To je vynikaj�c�. Ale cel� v�c se u� vy�e�ila sama. Soudce je mrtv�.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //N�jak� idiot ho rozma��roval. No dobr�. To mi tak� docela sta��.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Tady m� p�r minc�. Za v�c mi ta zpr�va u� nestoj�.
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
	description = "Co je s Bennetem?";
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
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //Co je s Bennetem?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Tak�e u� jsi o tom sly�el. Ti bastardi ho zav�eli, jen tak pro nic za nic.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Jako kdybych nem�l dost starost� se sv�mi vlastn�mi lidmi - te� abych se staral je�t� o paladiny.
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
	description = "Co bude� s tou Bennetovou z�le�itost� d�lat?";
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
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Co bude� s tou Bennetovou z�le�itost� d�lat?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Je�t� nev�m. P�r chlapc� by r�do vtrhlo do m�sta, aby povyr�eli lordu Hagenovi v�echny zuby, jeden po druh�m.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Na podobnou akci na�t�st� nem�me dost lid�, nemluv� o tom, �e to nen� m�j styl.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //Tak�e tady bude� jen tak sed�t a klidn� p�ihl�et tomu, co se stane?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //To rozhodn� ne.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Kdy� dostate�n� rychle neprok�u Bennetovu nevinu, Lee za dal�� n�sledky u� neponese zodpov�dnost. Jeho lid� bez v�h�n� kdykoliv napadnou m�sto a Benneta osvobod� n�sil�m."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares je je�t� ve m�st� a sna�� se zjistit, jak bychom odtamtud mohli Benneta dostat.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //J� se mezit�m sna��m trochu uklidnit svoje lidi. Jenom douf�m, �e to nebude Laresovi trvat moc dlouho.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //Jo, a abych nezapomn�l... Buster s tebou chce mluvit. Necht�l mi ��ct, o co jde. Mo�n� by ses za n�m m�l stavit!
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
	description = "Mohl bych ti s tou z�le�itost� kolem Benneta pomoci?";
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
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Mohl bych ti s tou z�le�itost� kolem Benneta pomoci?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Jasn�, tro�ka rozumu a rozvahy nem��e b�t na �kodu.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Innos v�, �e kolem pob�h� a� p��li� pitomc�.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //B� do m�sta a mrkni se, jestli nenajde� n�jak� zp�sob, jak odtamtud Benneta dostat.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Ale moc se nezdr�uj, nev�m, jak dlouho je�t� udr��m sv� chlapy na uzd�.
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
	description = "N�jak� novinky o Bennetovi?";
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
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //N�jak� novinky o Bennetovi?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Kdy� u� nic jin�ho, tak se zd�, �e se ve v�zen� nedo�kal ��dn� �hony.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Dobr� pr�ce.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Ne, je�t� po��d nev�me dost.
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

	description	 = 	"Co se stalo, zat�mco jsem tu nebyl?";
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
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Co se stalo, zat�mco jsem tu nebyl?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Ten parchant Sylvio se doslechl o drac�ch v Hornick�m �dol� a ud�lal z farmy tot�ln� bl�zinec.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Sna�il se kluky p�esv�d�it, aby s n�m �li do Hornick�ho �dol�. Sliboval jim sl�vu, pocty, zlato a dal�� pt�koviny.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Spousta z nich se necht�la nechat pro Sylvia zab�t, ale na�lo se p�r idiot�, kte�� mu na ty kecy sko�ili.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Nakonec si nechali d�t od Benneta v�stroj a vyrazili na cestu.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(pohrdav�) No. Nakonec jsem docela r�d, �e Sylvio odsud z farmy kone�n� vypadl.
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
	description	 = 	"Mohl bys m� cvi�it?";
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
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //M��e� m� u�it?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //M��u ti uk�zat, jak bojovat s obouru��kem.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Ale nem�m �as t� u�it z�rove� z�klady.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //A� se dostane� na ur�itou �rove�, vezmu si t� na starost. Do t� doby si bude� muset naj�t jin�ho u�itele.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //Sly�el jsem, �e jsi docela dobr�. Vsad�m se ale, �e bych t� po��d mohl p�r v�c� nau�it.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee m� nau�� bojovat s obouru�n�mi zbran�mi.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Tak�e jestli chce�, m��u si t� vz�t do par�dy. Ale bude t� to n�co st�t.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Kolik?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 zlat�ch a m��eme si pl�cnout.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"To je pro m� moc drah�.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Dohodnuto. Tady jsou pen�ze.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //To je pro m� moc drah�.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Nech si to proj�t hlavou. U�itele m�ho kalibru jen tak nenajde�.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //Dohodnuto. Tady jsou pen�ze.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //Dobr�. M��e� si b�t jist�, �e za to stoj�m.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee m� nau�� bojovat s obouru�n�mi zbran�mi.");
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
	description = "Za�n�me s tr�ninkem.";
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
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Za�n�me s tr�ninkem.
	
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
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Te� jsi skute�n� mistr v boji s obouru�n�mi zbran�mi.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //U� ��dn�ho u�itele nepot�ebuje�.
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
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Te� jsi skute�n� mistr v boji s obouru�n�mi zbran�mi.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //U� ��dn�ho u�itele nepot�ebuje�.
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

	description	 = 	"Je�t��i rozn�ej� dra�� vejce po cel� zemi.";
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
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Je�t��i rozn�ej� dra�� vejce po cel� zemi.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //M�lo m� to napadnout. Je na�ase vypadnout.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //Co s nimi tedy m�m d�lat?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Rozbij je. Co jin�ho?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Ze sko��pek by mo�n� �lo ud�lat brn�n� nebo tak n�co.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Vypadaj� docela pevn�. Promluv si o tom s Bennetem.
		B_LogEntry (TOPIC_DRACHENEIER,"S dra��m vejcem toho Lee moc nenad�l� - poslal m� proto za kov��em Bennetem."); 
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
	description = "Jak to jde na farm�?";
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
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Jak to jde na farm�?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //No, co ode�el Sylvio, je tady docela klid.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //To nezn� �patn�.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Pr�ce bohu�el neubylo. Chlapi jsou ��m d�l t�m nespokojen�j��, proto�e musej� pracovat i za Sylviovy lidi.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Ale s t�m si hlavu nel�mej. J� si n�jak porad�m.
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
	
	description	 = 	"Nenapad� t�, jak bych mohl z�skat lo� paladin�?";
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
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Nenapad� t�, jak bych mohl z�skat lo� paladin�?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //Mysl�, �e bych tady je�t� byl, kdybych to v�d�l? Tu hl�daj� je�t� l�p ne� transporty rudy ve Star�m t�bo�e.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Mus� existovat n�jak� zp�sob, jak se na lo� dostat.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Jist�. Dostat se na palubu nen� nic t�k�ho.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Koneckonc� m�me soudce ve sv� moci. Zkus za n�m zaj�t a vym��knout z n�j dopis, kter� by t� k tomu oprav�oval.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee se domn�v�, �e nejlep�� zp�sob, jak se dostat na palubu paladinsk� lodi, je obdr�et od soudce plnou moc. Nen� ale p��li� pravd�podobn�, �e mi n�co takov�ho vyd� jen tak.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //M�m tady fale�n� opr�vn�n�. S jeho pomoc� t� str�e nechaj� proj�t.
		
			B_LogEntry (TOPIC_Ship,"Star� dobr� Lee. M� u sebe pad�lan� dopis, s jeho� pomoc� se m��u dostat na palubu paladinsk� lodi.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Ale to nen� v�echno. Na samotnou plavbu bude� pot�ebovat kapit�na, pos�dku a tak.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Je toho spousta, bez �eho se neobejde�.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Koho bych m�l najmout do pos�dky?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Nezn� n�koho, kdo by mohl lo� ��dit?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Nezn� n�koho, kdo by mohl lo� ��dit?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Pokud v�m, tak Torlof se na mo�i vyzn�. V�, co je co, a tak.

	B_LogEntry (TOPIC_Captain,"Torlof je star� n�mo�n�k, mo�n� by cht�l b�t m�m kapit�nem.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Koho bych m�l najmout do pos�dky?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //To si mus� rozhodnout s�m. J� bych s sebou ale bral jenom toho, komu mohu v��it. M� dost lid�, kter�m m��e� d�v��ovat?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Pokud bys pot�eboval do pos�dky n�jak�ho kov��e, zkus se zeptat Benneta. Je ten nejlep��, jak�ho m��e� naj�t.

	B_LogEntry (TOPIC_Crew,"Ve v�ci pos�dky toho pro m� Lee moc ud�lat nemohl. Ale poradil mi, �e bych m�l najmout jen lidi, kter�m mohu v��it. M�m se zeptat je�t� Benneta, mohlo by ho to zaj�mat.");
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

	description	 = 	"P�semn� pln� moc fungovala.";
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
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //To povolen� zafungovalo. Lo� je te� moje. Spolupr�ce s t�m soudcem byla jedna radost.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //Vida. To poni�ov�n� p�ed t�m parchantem se ti nakonec p�ece jenom vyplatilo.
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
	description	 = 	"Chci tu lo� ukr�st.";
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
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Chci tu lo� ukr�st.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //A jak to chce� prov�st?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //Bude to hra�ka - p�jdu tam, uk�u jim ty pap�ry, vezmu si lo�.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Kdy� ��k�. Vezmi si je. Douf�m, �e v�, co d�l�.
	
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
	description	 = 	"Poplav� se se mnou?";
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
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Poplav� se se mnou?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //D�l� si srandu? Jasn� �e do toho jdu. M�m na pevnin� p�r nevy��zen�ch ��t�.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //Krom� toho t� m��u u�it boj s jednoru�n�mi a obouru�n�mi zbran�mi. Mohl bych se ti hodit.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee u� se nem��e do�kat, a� uvid� pevninu. Nab�dl mi ve�kerou podporu - tak dobr�ho u�itele bojov�ch um�n� bych nena�el �iroko daleko.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Lo� je moment�ln� pln�, ale pokud se tam najde m�sto, tak se vr�t�m.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"D�m ti v�d�t, jestli t� budu pot�ebovat.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Tak si b� sbalit!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //Tak si b� sbalit!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Co�e? Te� hned?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Ano, chci odsud vypadnout, tak�e jestli m� v pl�nu jet se mnou, b� do p��stavu. Setk�me se na lodi.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //Na tuhle chv�li jsem �ekal hezky dlouho. Budu tam.
	
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
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //D�m ti v�d�t, jestli t� budu pot�ebovat.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //S�m mus� v�d�t, co chce�. Ale dobr�ch bojovn�k� nebude� m�t nikdy dost.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //(za�kleb� se) Leda naprost�ch pitomc� jako Sylvio.

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
	description	 = 	"P�ece jenom bys mi k ni�emu nebyl!";
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
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //P�ece jenom bys mi k ni�emu nebyl!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Jak je libo, kdy� tak v�, kde m� naj�t!
	
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
	description	 = 	"P�ece jenom bys mi k n��emu mohl b�t!";
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
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //P�ece jenom bys mi k n��emu mohl b�t!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //V�d�l jsem, �e m� bude� pot�ebovat! Setk�me se na lodi.
		
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
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //V� co, b� do h�je. Nejd��v mi �ekne�, abych s tebou jel, pak m� zase po�le� pry�.
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //Najdi si n�jak�ho jin�ho pitomce!
	
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



































