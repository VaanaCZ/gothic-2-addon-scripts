// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Onar_EXIT   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 999;
	condition   = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Onar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				Hallo 
// ************************************************************
INSTANCE DIA_Onar_Hallo (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Onar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_Hallo_Info()
{
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Kdo t� sem pustil?!
	AI_Output (self, other, "DIA_Onar_Hallo_14_01"); //Co d�l� na m� farm�?!
};

// ************************************************************
// 			  				PERM 
// ************************************************************
INSTANCE DIA_Onar_PERM (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent   = TRUE;
	description = "Je tady na farm� v�echno v po��dku?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Je tady na farm� v�echno v po��dku?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //Nech�pu, co se star�. Nepat�� na farmu!
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //Samoz�ejm� douf�m, �e ano! Za to p�ece plat�m!!
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Ud�l� nejl�p, kdy� zajde� za Torlofem a po��d� o n�jakou pr�ci.
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Jo, jasn�. Jen si b� lovit ty sv� draky.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //Vy pokryte�t� bastardi z kl�tera tu nejste v�t�ni!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //Na�e pohostinnost se na kr�lovsk� vojska nevztahuje.
	};
};

// ************************************************************
// 			  				Work 
// ************************************************************
INSTANCE DIA_Onar_Work (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent   = FALSE;
	description = "Chci pro tebe pracovat!";
};
FUNC INT DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_Work_Info()
{
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //Chci pro tebe pracovat!
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Te� nepot�ebuju ��dn�ho dal��ho n�den�ka.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //Moji lid� se staraj� o v�echno ostatn�.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //Nem� tady co d�lat, tak mazej!
};


// ************************************************************
// 			  				WorkAsSld
// ************************************************************
INSTANCE DIA_Onar_WorkAsSld (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent   = FALSE;
	description = "Chci se st�t �oldn��em!";
};
FUNC INT DIA_Onar_WorkAsSld_Condition()
{
	if (Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Onar_Work))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WorkAsSld_Info()
{
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //Chci se st�t �oldn��em!
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //Ty? �oldn��? Nenech se vysm�t! Pokud bys jako �old�k za n�co st�l, musel by mi o tom Lee n�co ��ct.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_02"); //A te� vypadni, pronto!
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
INSTANCE DIA_Onar_Aufstand (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 3;
	condition   = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent   = FALSE;
	description = "Vzbou�ili jste se proti m�stu, nebo co jsem to zaslechl?";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //Vzbou�ili jste se proti m�stu, nebo co jsem to zaslechl?
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //Te� m� poslouchej. Zd�dil jsem tuhle farmu a tuhle p�du po sv�m otci.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //A on ji zase zd�dil po SV�M otci.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //Nedovol�m t�m nena�ranejm kr�lovskejm pitomc�m odjet s t�m v��m jen proto, aby nakrmili tu svoj� arm�du budi�kni�em�.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //Ta v�lka se sk�ety nikdy neskon��. A kde budeme my? Mezi prvn�mi, co padnou.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //Ne - rad�ji budu svou farmu br�nit s�m! Pen�ze, kter� takhle na�et��m, mi zaplat� celou arm�du.
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
INSTANCE DIA_Onar_WegenPepe (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 4;
	condition   = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent   = FALSE;
	description = "Kv�li Bullcovi te� m�te o p�r ovc� m��.";
};
FUNC INT DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenPepe_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Kv�li Bullcovi te� m�te o p�r ovc� m��.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //O �em to mluv�? Kdo je Bullco?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //Jeden ze �oldn���.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //Pro� by m� to m�lo zaj�mat? Jestli m� z�lusk na moje ovce, bude se muset zodpov�dat Leeovi.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //Tak co m� otravuje� s takovejma nepodstatnejma hloupostma?
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
INSTANCE DIA_Onar_WegenSekob (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 5;
	condition   = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent   = FALSE;
	description = "P�i�el jsem kv�li Sekobovu n�jmu...";
};
FUNC INT DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenSekob_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //P�i�el jsem kv�li Sekobovu n�jmu...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //A pro� s t�m ksakru leze� za mnou? Dej ty pen�ze Torlofovi.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //Pro� si zatracen� mysl�, �e to je TVOJE starost?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Chci se st�t �oldn��em. V�b�r n�jemn�ho je sou��st� zkou�ky.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Ale Sekob nem� ��dn� pen�ze. U� jsem mu to nandal.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //��k�, �e to je kv�li �patn� �rod�.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //(�ve) Ty pitom�e! Mysl�, �e nech� ty pen�ze jen tak n�kde povalovat? N�kam je ukryl!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //V�, kolik napr�elo? �patn� �roda, tup�e.
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //B� a vymla� z n�j ty prachy.
	Onar_WegenSekob = TRUE;
};


// ************************************************************
// 			  			Lee schickt mich 
// ************************************************************
INSTANCE DIA_Onar_LeeSentMe   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 6;
	condition   = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent   = FALSE;
	description = "Poslal m� Lee. Chci tady pracovat jako �oldn��!";
};
FUNC INT DIA_Onar_LeeSentMe_Condition()
{
	if (Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_LeeSentMe_Info()
{
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Poslal m� Lee. Chci tady pracovat jako �oldn��!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //U� mi o tom �ekl.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //Kdy� jsem t� poprv� vid�l, nem�l jsem o tob� valn� m�n�n�.
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Ale kdy� si Lee mysl�, �e to zvl�dne�, jsem ochoten d�t ti �anci.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //On je za tebe zodpov�dn�. Tak se koukej �init.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //Ale ��dn� blbosti! Nech farm��e a slu�ky na pokoji a hlavn� si nic nep�ivlast�uj, jasn�?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //S ��mkoli dal��m se obra� na Leeho.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //V�echno, o �em se pot�ebujeme bavit, se t�k� tv�ho �oldu.

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar mi dal sv�j souhlas. Te� u� mi nic nezabr�n�, abych se p�idal k �old�k�m!");
};



// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------

INSTANCE DIA_Onar_HowMuch   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 7;
	condition   = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent   = FALSE;
	description = "Tak co je s t�m �oldem?";
};
FUNC INT DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_HowMuch_Info()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //Tak co je s t�m �oldem?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Fajn, pod�vejme...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //Nevypad� moc k sv�tu.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //Ty sis v�n� nebyl dvakr�t, kdy� Innos rozd�val rozum. To se pozn� podle t� v�ci se Sekobem.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //U� jsi tu nejednou zp�sobil probl�my.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //A po��d mi za z�dy vyv�d� sam� pt�koviny.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Nech m� h�dat...
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //Co �ik�?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "N�jak� n�mitky?", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "To nen� zrovna moc...", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "Za den?", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //Za den?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //Cos myslel? Za t�den? V�n� ti to moc nep�l�.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Tak zvedni ten sv�j zadek a b� pro ty pen�ze.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Nehodl�m se o to za tebe postarat.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //To nen� zrovna moc.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Jasn�, jestli chce�, m��e� u m� pracovat zadarmo.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //Mimochodem, tohle je v�echno, co dostane�!
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Sv�j plat si mohu u Onara vyzvednout ka�d� den.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //N�jak� n�mitky?
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //Taky si mysl�m. Te� zajdi za Leem.
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Sv�j plat si mohu u Onara vyzvednout ka�d� den.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_CollectGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 8;
	condition   = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent   = TRUE;
	description = "Dej mi m�j �old!";
};
FUNC INT DIA_Onar_CollectGold_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_CollectGold_Info()
{
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Dej mi m�j �old!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //Plat�m �old�k�m, ne drakobijc�m.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //Nestarej se o to, co dostane� za �kol!
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //Ptal jsem se Torlofa, jak ti to jde. A ��kal, �e ti trv� v��nost, ne� n�co ud�l�.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //Nebudu pl�tvat pen�zi na darmo�lapy.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //Te� bude� n�kolik t�dn� makat bez n�roku na �old! To t� mo�n� nau��.
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //Sly�el jsem, �es to zpackal. Nejd��v zajdi za Leem a dej tu v�c do po��dku.
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //P�esko�ilo ti snad?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Nejd��v bude� p�r dn� pracovat pro m�. �old bude� dost�vat v�dycky n�sleduj�c� den.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //Kdes byl v�era?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //Kdes byl posledn�ch p�r dn�?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //Nikdy ses tu neuk�zal.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //Kdo v�, kde ses fl�kal.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag sp�ter...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //(zkrou�en�) No dobr�. Tady je tv�j �old.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //Co? Ned�lal jsi nic jin�ho, ne� �e ses poflakoval kolem? Teda kdy� jsi zrovna nespal?
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //Za to ti platit nebudu!
		};
		
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_MariaGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 9;
	condition   = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent   = FALSE;
	description = "Maria si mysl�, �e jsem nedostal dost.";
};
FUNC INT DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_MariaGold_Info()
{
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria si mysl�, �e jsem nedostal dost.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //Co?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //��kala, �e bys mi m�l platit v�c.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //(remc�) Ta �ensk� taky mus� do v�eho strkat nos.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //�ekla ti kolik?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //Ne.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //Dobr�, po��naje p��t�m �oldem bude� dost�vat o 10 zlat�ch v�c.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Ale ani o minci v�c, jasn�?
	
	SOLD = SOLD + 10;
};	


// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------

instance DIA_Onar_WannaSheep	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_WannaSheep_Condition;
	information	 = 	DIA_Onar_WannaSheep_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chci koupit ovci!";
};
func int DIA_Onar_WannaSheep_Condition ()
{	
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Onar_WannaSheep_Info ()
{
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //Chci koupit ovci!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Tak co s t�m leze� sem? Vid� tu snad n�jakou ovci?
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //J�...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Jestli chce� koupit ovci, zajdi na pastvinu, je napravo od m�ho domu.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Pepe ti n�jakou prod�.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Pepe je mrtv�, je mi l�to.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Uf! V tom p��pad�... nech mi tu za ni 200 zlat�ch a vezmi si ji z pastviny s�m.
		
		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_BuyLiesel_Condition;
	information	 = 	DIA_Onar_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady m�, 200 zlat�ch. Dej mi tu ovci.";
};
func int DIA_Onar_BuyLiesel_Condition ()
{	
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Onar_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Tady m� t�ch 200 zlat�ch. Dej mi tu ovci.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //M��e� si ji z pastviny vz�t s�m.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Jedna z nich za tebou ur�it� p�jde. V�t�ina jich sly�� na jm�no Betsy.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //Nem� tolik zlata. Nepl�tvej m�m drahocenn�m �asem.
	};
};
