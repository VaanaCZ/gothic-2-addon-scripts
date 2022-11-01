// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hagen_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Hagen_EXIT_Condition;
	information	= DIA_Hagen_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hagen_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Hagen_PMSchulden (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PMSchulden_Condition;
	information = DIA_Hagen_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Hagen_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Hagen_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hagen_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Хорошо, что ты пришел. Ты можешь заплатить штраф прямо сейчас.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //Ты не очень-то серьезно относишься к законам города, да?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //Список твоих преступлений все растет и растет.
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //И не говори мне, что ты не знал этого!
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Ты заплатишь максимальный штраф.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //Похоже, ситуация изменилась.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //Больше нет свидетелей убийства, совершенного тобой!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //Никто теперь не может подтвердить, что ты воровал!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //Больше нет свидетелей твоей драки.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //Все обвинения против тебя больше не находят подтверждений.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //Я не знаю, что случилось в городе, и не хочу знать.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //Просто позаботься, чтобы у тебя не было проблем здесь.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //Как бы то ни было, я решил простить твои прегрешения.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Смотри, чтобы этого больше не повторялось.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Ты, тем не менее, заплатишь штраф в полном объеме.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Итак, ты будешь платить?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"У меня нет столько золота!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"Сколько там нужно?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"Я хочу заплатить штраф!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //Сколько там на этот раз?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"У меня нет столько золота!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"Сколько там нужно?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"Я хочу заплатить штраф!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Hagen_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Hagen_PETZMASTER   (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PETZMASTER_Condition;
	information = DIA_Hagen_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Hagen_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_PETZMASTER_Info()
{
	Hagen_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime hцher ist...
	
	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //Твоя слава опережает тебя. Ты нарушил законы города.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Ты влип в дерьмо по уши.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //Убийство - серьезное преступление!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS Mцrder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Не говоря уже о других обвинениях.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Страже приказано казнить убийц на месте.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //Убийства неприемлемы в этом городе. Но ты можешь подтвердить свое раскаяние, заплатив штраф.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //Ты обвиняешься в воровстве!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Не говоря уже о других преступлениях, о которых я слышал.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //Это нарушение законов города. Ты должен заплатить штраф.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Ты ввязался в драку. Таким образом ты нарушил закон.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //А что там еще с овцой?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Нарушение законов города - это нарушение законов Инноса.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Следовательно, ты должен заплатить за это.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getцtet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Ты убил нашу овцу - я сначала даже не поверил в это.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //Зачем ты делаешь все это?!
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //Ты должен заплатить компенсацию!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //Сколько?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"У меня нет столько золота!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"Я хочу заплатить штраф!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //Я хочу заплатить штраф!
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //Хорошо! Я позабочусь, чтобы все в городе узнали об этом. Это в некоторой степени восстановит твою репутацию.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //У меня нет столько золота!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Тогда позаботься о том, чтобы раздобыть это золото как можно быстрее.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //И я предупреждаю тебя: если ты при этом усугубишь свою вину, на пощаду не рассчитывай.
	
	Hagen_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Hallo (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Hallo_Condition;
	information	 = 	DIA_Lord_Hagen_Hallo_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};
func int DIA_Lord_Hagen_Hallo_Condition ()
{	
	if (hero.guild != GIL_NONE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //Я уже слышал о тебе.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Лотар докладывал, что ты хочешь поговорить со мной.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Ты чужеземец, который требует Глаз Инноса.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Я лорд Хаген.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Паладин короля, воин нашего владыки Инноса и главнокомандующий Хориниса.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //Я очень занятой человек. Поэтому не трать мое время попусту. А теперь скажи, зачем ты здесь.
};

///////////////////////////////////////////////////////////////////////
//	Info Frieden
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Frieden (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Frieden_Condition;
	information	 = 	DIA_Lord_Hagen_Frieden_Info;
	permanent	 = 	FALSE;
	description	 =  "Я принес предложение мира от наемников!";
};
func int DIA_Lord_Hagen_Frieden_Condition ()
{	
	if (MIS_Lee_Friedensangebot == LOG_RUNNING)
	&& (Npc_HasItems (other, itwr_Passage_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Frieden_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //Я принес предложение мира от наемников!
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //(раздражительно) Хм... покажи!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Я знаю генерала Ли. Мне также известно об обстоятельствах, при которых он был приговорен к исправительным работам в колонии.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Я считаю его благородным человеком. Я готов даровать ему помилование - но только ему!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //Это не касается его людей, впрочем. Большинство из них - отъявленные головорезы и заслуживают наказания!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Я ни за что не помилую их. Можешь так и передать Ли.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //Это все?
	};
	B_LogEntry (Topic_Frieden,"Лорд Хаген готов даровать прощение Ли, но не другим наемникам."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Armee
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Armee (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Armee_Condition;
	information	 = 	DIA_Lord_Hagen_Armee_Info;
	permanent	 = 	FALSE;
	description	 =  "Силы зла собираются очень близко отсюда. В Долине Рудников.";
};
func int DIA_Lord_Hagen_Armee_Condition ()
{	
	if (!MIS_Lee_Friedensangebot == LOG_RUNNING)
	|| (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Armee_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //Силы зла собираются очень близко отсюда. В Долине Рудников.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //В Долине Рудников? Мы отправили туда экспедицию. До нас также доходили сведения, что Проход оккупирован орками.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Но до сего момента до меня не доходило никаких сведений об армии Зла.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //Это, что, такая уловка, чтобы я поверил, что мне необходимо заключить союз с наемниками?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //Нет.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //(скептически) Что это еще за армия?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //Армия драконов, которые собрали вокруг себя орды прислужников.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //Драконов? Согласно старинным писаниям, драконов не видели уже много веков.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Скажи мне - почему я должен верить тому, что ты говоришь?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //Вопрос не в том, должен ли ты мне верить. Вопрос в том, можешь ли ты себе позволить НЕ поверить мне в случае, если я говорю правду.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Пока я не получу доказательств, я не могу позволить себе послать еще людей туда.
};

///////////////////////////////////////////////////////////////////////
//	Info Proof
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Proof (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Proof_Condition;
	information	 = 	DIA_Lord_Hagen_Proof_Info;
	permanent	 = 	TRUE;
	description	 =  "То есть ты хочешь, чтобы я принес тебе доказательство?";
};
func int DIA_Lord_Hagen_Proof_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee )
	&& (Hagen_BringProof == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Proof_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //То есть ты хочешь, чтобы я принес тебе доказательство?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //Именно. Пройди через Проход в Долину Рудников. Когда ты будешь там, найди нашу экспедицию, а когда ты найдешь их, поговори с командующим Гарондом.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Вряд ли кто-то лучше него знает ситуацию там.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Если он подтвердит твои слова, я буду готов помочь тебе.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //Значит ли это, что ты отдашь мне Глаз Инноса?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //Глаз Инноса... хорошо. Принеси мне доказательство, и я распоряжусь, чтобы тебе было позволено надеть этот амулет.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //То есть я могу считать, что ты дал слово?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Можешь, так как я действительно дал его.
		Hagen_BringProof = TRUE;
	}
	else
	{
		if (hero.guild == GIL_NOV)
		{
			PrintScreen	(PRINT_Addon_GuildNeeded_NOV, -1,-1, FONT_Screen ,2);
		}
		else 
		{	
			PrintScreen	(PRINT_Addon_GuildNeeded, -1,-1, FONT_Screen ,2);
		};	
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Auge (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Auge_Condition;
	information	 = 	DIA_Lord_Hagen_Auge_Info;
	permanent	 = 	FALSE;
	description	 =  "Что ты знаешь о Глазе Инноса?";
};
func int DIA_Lord_Hagen_Auge_Condition ()
{	
	return TRUE;
};
func void DIA_Lord_Hagen_Auge_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_00"); //Что ты знаешь о Глазе Инноса?
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //Это божественный артефакт. (задумчиво) В древних пророчествах он упоминается в связи с драконами.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //Однако писания также говорят, что его может носить только Избранный Инноса.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //Я и есть Избранный Инноса!
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Тогда, возможно, ты действительно достоин получить этот амулет.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Pass (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Pass_Condition;
	information	 = 	DIA_Lord_Hagen_Pass_Info;
	permanent	 = 	FALSE;
	description	 =  "Как я пройду через Проход?";
};
func int DIA_Lord_Hagen_Pass_Condition ()
{	
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Pass_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //Как я пройду через Проход?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //Я дам тебе ключ от ворот Прохода. Однако тебе самому придется решать, как пробраться через толпы орков.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Да защитит тебя Иннос.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Лорд Хаген хочет, чтобы я принес ему доказательства существования армии Зла. Я должен отправиться в Долину рудников и поговорить с командующим Гарондом.");
	
	if (Fernando_ImKnast == FALSE)
	{
		B_StartOtherRoutine (Fernando,"WAIT"); 
	};
	
	Wld_InsertNpc (BDT_1020_Bandit_L, "NW_TROLLAREA_PATH_47");	//Joly: //ADDON stцrt dann nicht mehr
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lord_Hagen_Ornament		(C_INFO)
{
	npc		 	= PAL_200_Hagen;
	nr		 	= 10;
	condition	= DIA_Addon_Lord_Hagen_Ornament_Condition;
	information	= DIA_Addon_Lord_Hagen_Ornament_Info;

	description	= "Я ищу металлический орнамент.";
};

func int DIA_Addon_Lord_Hagen_Ornament_Condition ()
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
	&& (Lord_Hagen_GotOrnament == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lord_Hagen_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Я ищу металлический орнамент. Он должен был быть в круге камней у фермы Лобарта. 
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Ты имеешь в виду вот эту вещь? Мы думали, что это магическая руна, но оказалось, что она совершенно бесполезна.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //Можешь ее забрать. Мне она не нужна.
	
	CreateInvItems (self, ItMi_Ornament_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Ornament_Addon, 1);	
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Khorinis (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Khorinis_Condition;
	information	 = 	DIA_Lord_Hagen_Khorinis_Info;
	permanent	 = 	FALSE;
	description	 =  "Зачем вы пришли в Хоринис?";
};
func int DIA_Lord_Hagen_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //Зачем вы пришли в Хоринис?
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Мы выполняем важное задание королевства. Приказы нам исходят непосредственно от короля Робара.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //Я говорил тебе, что мы отправили экспедицию в Долину Рудников. Это главная причина нашего присутствия здесь.
};

///////////////////////////////////////////////////////////////////////
//	Info Minental
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Minental (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Minental_Condition;
	information	 = 	DIA_Lord_Hagen_Minental_Info;
	permanent	 = 	TRUE;
	description	 =  "А что ваши люди делают в Долине Рудников?";
};
func int DIA_Lord_Hagen_Minental_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Khorinis))
	&& (KnowsPaladins_Ore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Minental_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //А что ваши люди делают в Долине Рудников?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //Я не вижу причин рассказывать тебе об этом!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //Ты был там. Ты должен знать.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //Хорошо, так как ты все равно идешь туда, я все же расскажу тебе.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //Причиной всему - магическая руда. Она может решить исход этой войны.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Без достаточного количества оружия из магической руды у королевской армии нет ни единого шанса против элитных воинов орков.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //А шахты с магической рудой, находящиеся на острове, - последние, к которым у нас еще есть доступ.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //Как только наш корабль будет загружен рудой, мы отправимся назад, на материк.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //Значит, война против орков идет плохо, да?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //Я и так сказал тебе слишком много.
	};
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Hagen_CanTeach		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	5;
	condition	 = 	DIA_Hagen_CanTeach_Condition;
	information	 = 	DIA_Hagen_CanTeach_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Я ищу мастера-мечника.";
};
func int DIA_Hagen_CanTeach_Condition ()
{	
	if (LordHagen_Teach2H == FALSE)
	&& (other.guild == GIL_PAL)
	&& (other.aivar[REAL_TALENT_2H] >= 90)
	&& (other.aivar[REAL_TALENT_2H] < 100)
	{
		return TRUE;
	};
};
func void DIA_Hagen_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Я ищу мастера-мечника.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //Да? Считай, что ты нашел его.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Лорд Хаген может обучить меня сражаться двуручным оружием.");
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Hagen_Teach(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 100;
	condition	= DIA_Hagen_Teach_Condition;
	information	= DIA_Hagen_Teach_Info;
	permanent	= TRUE;
	description = "Начнем (изучить бой двуручным оружием).";
};                       
//----------------------------------
var int DIA_Hagen_Teach_permanent;
//----------------------------------
FUNC INT DIA_Hagen_Teach_Condition()
{
	if (LordHagen_Teach2H == TRUE)
	&& (DIA_Hagen_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hagen_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hagen_Teach_15_00"); //Приступим к обучению!
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);

};
FUNC VOID DIA_Hagen_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Ты стал великолепным мечником. Мне больше нечему учить тебя.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Да ведет твою руку в будущих свершениях мудрость мастера-мечника.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Hagen_Teach);
};

FUNC VOID DIA_Hagen_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)) ,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)) ,DIA_Hagen_Teach_2H_5);	
};

FUNC VOID DIA_Hagen_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);	
	
};
//##############################################################
//###
//###	RitterAufnahme
//###
//##############################################################

//**************************************************************
//	Ich will auch ein Paladin werden.
//**************************************************************


INSTANCE DIA_Lord_Hagen_Knight		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	990;
	condition	 = 	DIA_Lord_Hagen_Knight_Condition;
	information	 = 	DIA_Lord_Hagen_Knight_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Я хочу поступить на службу в орден.";
};
FUNC INT DIA_Lord_Hagen_Knight_Condition ()
{	
	if (hero.guild == GIL_MIL)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Knight_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Я хочу поступить на службу в орден.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Хорошо, ты доказал, что у тебя есть мужество, опыт и знания, чтобы служить Инносу.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Твои дела свидетельствуют о том, что у тебя чистое сердце.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Если таково твое желание, наш орден с радостью примет тебя.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Я еще не совсем уверен.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Я готов!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //Стать воином Инноса означает  полностью посвятить себя служению Инносу.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //Только самые благородные и мужественные воины могут быть приняты в орден.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Если ты твердо решил стать паладином, ты должен доказать, что достоин этого.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Я еще не совсем уверен.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Тогда иди и освободи свое сердце от сомнений. Возвращайся, когда будешь готов.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //Я готов!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //(торжественно) Тогда так тому и быть!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //(торжественно) Много людей вступило на этот путь и отдало свои жизни во имя Инноса.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //(торжественно) Ты клянешься, что твои дела не опозорят их честь и будут прославлять Инноса?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //Клянусь!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Тогда отныне ты принадлежишь к нашему братству.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Я произвожу тебя в воины Инноса.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //Я даю тебе оружие и доспехи рыцаря. Носи их с гордостью, рыцарь!

	CreateInvItems (self,ITAR_PAL_M,1);
	B_GiveInvItems (self,other,ITAR_PAL_M,1);

	if ((other.HitChance[NPC_TALENT_2H]) >= (other.HitChance[NPC_TALENT_1H])) //Damit der SC auch seine Lieblingswaffe bekommt ;-)
	{
		CreateInvItems (self,ItMw_2h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_2h_Pal_Sword,1);
	}
	else
	{
		CreateInvItems (self,ItMw_1h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_1h_Pal_Sword,1);
	};		 
	
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,ITAR_PAL_M);

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //С этого времени благодаря твоему рангу ты будешь иметь доступ в монастырь.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Альбрехт научит тебя магии, иди и поговори с ним.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //И, конечно же, наши казармы в верхней части города всегда открыты для тебя.

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild (other, GIL_PAL);
	
	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};


//***********************************************
//	Wie kann ich mich wьrdig erweisen
//***********************************************

INSTANCE DIA_Lord_Hagen_WhatProof		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	991;
	condition	 = 	DIA_Lord_Hagen_WhatProof_Condition;
	information	 = 	DIA_Lord_Hagen_WhatProof_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Как я могу доказать, что достоин?";
};

FUNC INT DIA_Lord_Hagen_WhatProof_Condition ()
{	
	if (Hagen_GaveInfoKnight == TRUE)	
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_WhatProof_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //Как я могу доказать, что достоин?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //Твои дела покажут, достоин ты или нет.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //Мы сражаемся за свободу и справедливость во имя Инноса.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Мы сражаемся против Белиара и его приспешников, которые жаждут уничтожить орден Инноса.
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Я понимаю.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //Ты ничего не понимаешь! Наша честь - наша жизнь, а наша жизнь - Иннос.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Паладин идет в бой с именем Инноса на устах, и многие из нас положили свою жизнь на алтарь вечной борьбы Добра со Злом.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //Все мы как один посвятили себя этой борьбе. Если мы потерпим поражение, мы оскверним память наших павших товарищей.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Только тот, кто сердцем понимает это, достоин быть паладином.
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

INSTANCE DIA_Lord_Hagen_KAP3_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   PERM KAP 3
// ************************************************************

var int Hagen_KnowsEyeKaputt;
// --------------------------

INSTANCE DIA_Lord_Hagen_KAP3U4_PERM(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 998;
	condition	= DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information	= DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent	= TRUE;
	description = "Как ситуация?";
};                       
FUNC INT DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3U4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //Как ситуация?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Я должен найти способ спасти эту экспедицию.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Мы должны сделать что-то с драконами.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //(себе под нос) Возможно, Глаз Инноса может спасти нас всех...
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Я с ума сойду здесь. Я солдат, а не бюрократ.
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //Из-за всей этой бумажной работы, что я должен делать, я уже почти забыл ощущение от клинка в руке.
	};
};

// ************************************************************
// 	  				   PERM KAP3U4
// ************************************************************

INSTANCE DIA_Lord_Hagen_EyeBroken(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 1;
	condition	= DIA_Lord_Hagen_EyeBroken_Condition;
	information	= DIA_Lord_Hagen_EyeBroken_Info;
	permanent	= FALSE;
	description = "Глаз у меня, но он поврежден.";
};                       
FUNC INT DIA_Lord_Hagen_EyeBroken_Condition()
{
	if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE)	))
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_EyeBroken_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_07"); //Глаз у меня, но он поврежден.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //ЧТО? О, Иннос! Что ты наделал? Нам нужен этот Глаз!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //Поговори с  Пирокаром! Должен быть способ восстановить его.
	Hagen_KnowsEyeKaputt = TRUE;
};

//*********************************************************************
//	Info BACKINTOWN
//*********************************************************************

instance DIA_Lord_Hagen_BACKINTOWN		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_BACKINTOWN_Condition;
	information	 = 	DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Я принес тебе новости от Гаронда.";
};
func int DIA_Lord_Hagen_BACKINTOWN_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) >= 1)
	&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_BACKINTOWN_Info ()
{
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //Я принес тебе новости от Гаронда. Вот, он начертал эти строки для тебя.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //Наша ситуация хуже, чем я опасался. Но доложи мне о ситуации в Долине Рудников.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //Паладины заперты в замке Долины Рудников, окруженном орками.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //Они потеряли много людей в старательских операциях и добыли очень мало руды.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //И, должен добавить, без помощи извне им всем скоро придет конец. Вот такие дела.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Я должен найти способ спасти эту экспедицию. Ты многое сделал для нас. Иннос благодарит тебя...
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //Мне не интересна его благодарность. Мне нужен его глаз.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Да, конечно. Я держу свое слово. Возьми это письмо. Оно откроет перед тобой монастырские врата.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Поговори с Пирокаром, высшим Магом Огня, и покажи ему это письмо с полномочиями. Он предоставит тебе доступ к Глазу Инноса.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //И еще одно, прежде чем ты уйдешь...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //Возьми эту руну в знак моей благодарности. Она вернет тебя в город, когда ты этого захочешь.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Лорд Хаген дал мне записку. Она заставит мастера Пирокара в монастыре отдать мне Глаз Инноса.");

			Wld_InsertNpc 		(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
			Wld_InsertNpc		(BDT_1050_Landstreicher, "NW_TROLLAREA_NOVCHASE_01");
			Wld_InsertNpc		(BDT_1051_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09"); 
			Wld_InsertNpc		(BDT_1052_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
			B_KillNpc 			(BDT_1020_Bandit_L);	//Joly: macht Platz fьr DMT_1200_Dementor
			Wld_InsertNpc		(DMT_1200_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1201_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1202_Dementor, "NW_TROLLAREA_RITUAL_01");
			//Wld_InsertNpc		(DMT_1203_Dementor, "NW_TROLLAREA_RITUAL_02");//Joly:waren zu viele!
			Wld_InsertNpc		(DMT_1204_Dementor, "NW_TROLLAREA_RITUAL_03");
			//Wld_InsertNpc		(DMT_1205_Dementor, "NW_TROLLAREA_RITUAL_04");
			Wld_InsertNpc		(DMT_1206_Dementor, "NW_TROLLAREA_RITUAL_05");
			Wld_InsertNpc		(DMT_1207_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1208_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1209_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1210_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1211_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			B_StartOtherRoutine (Pedro,"Tot"); 
				if (Npc_IsDead (MiltenNW))	//Wichtig, damit Milten vor dem Kloster steht!!!!!
				{ 
					Wld_InsertNpc (PC_MAGE_NW ,"NW_MONASTERY_ENTRY_01");
					B_StartOtherRoutine (MiltenNW,"START");		//zur Sicherheit
				};		
			Wld_InsertNpc		(NOV_650_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_650_ToterNovize);
			Wld_InsertNpc		(NOV_651_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_651_ToterNovize);
			Wld_InsertNpc		(NOV_652_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_652_ToterNovize);
			Wld_InsertNpc		(NOV_653_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_653_ToterNovize);
			Wld_InsertNpc		(NOV_654_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_654_ToterNovize);
			Wld_InsertNpc		(NOV_655_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_655_ToterNovize);
			Wld_InsertNpc		(NOV_656_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_656_ToterNovize);
	
			TEXT_Innoseye_Setting	=	TEXT_Innoseye_Setting_Broken; 
			Wld_InsertItem		(ItMi_InnosEye_Broken_Mis , "FP_TROLLAREA_RITUAL_ITEM"); 
};

//--------Hier kommt der gesamte Befreie den schmied Klumpatsch-------------


//*********************************************************
//		Lasse Bennet aus dem Knast
//*********************************************************

var int Hagen_einmalBennet;
// -----------------------

INSTANCE DIA_Lord_Hagen_RescueBennet		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_RescueBennet_Condition;
	information	 = 	DIA_Lord_Hagen_RescueBennet_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Мне нужно поговорить с тобой о Беннете.";
};

FUNC INT DIA_Lord_Hagen_RescueBennet_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Cornelius_IsLiar == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Мне нужно поговорить с тобой о Беннете.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Но этот наемник убил одного их моих людей.
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Почему ты так уверен, что убийца именно Беннет?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Я верю, что Беннет невиновен.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Беннет мог бы помочь нам починить Глаз Инноса.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Беннет мог бы помочь нам починить Глаз Инноса.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //Даже если бы он мог вызвать самого Инноса на землю...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //Он убил паладина. За это он будет казнен!
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //Почему ты так уверен, что убийца именно Беннет?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //У нас есть свидетель.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Как видишь, нет никаких сомнений в виновности этого наемника.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Кто этот свидетель?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Корнелиус, секретарь губернатора, видел, как произошло убийство.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Его описание подходит к Беннету, в этом нет никаких сомнений. По моему мнению, это достаточное доказательство.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Этот наемник будет повешен за измену.

	B_LogEntry (TOPIC_RESCUEBENNET,"Корнелиус, секретарь губернатора, является свидетелем. Он утверждает, что был свидетелем убийства."); 

	RecueBennet_KnowsCornelius = TRUE;
	//RescueBennet_KnowsWitness = TRUE; 
};
/*
FUNC VOID DIA_Lord_Hagen_RescueBennet_Witness()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Wer ist der Zeuge?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, der Sekretдr des Statthalters, hat den Mord gesehen.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Seine Beschreibung trifft zweifelsfrei auf Bennet zu. Damit ist die Sache fьr mich erledigt.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Der Sцldner wird wegen Landesverrats hдngen.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, der Sekretдr des Stadthalters, ist also der Zeuge. Er behauptet, den Mord beobachtet zu haben."); 

	RecueBennet_KnowsCornelius = TRUE;
};
*/
FUNC VOID DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //Я верю, что Беннет невиновен.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //Доказательства налицо. Он виновен.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //А что если доказательства неверны?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //Выбирай слова. Ты выдвигаешь серьезное обвинение.
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Если ты не можешь представить доказательство того, что свидетель солгал, тебе лучше попридержать язык.
};


//**************************************************************
//	Cornelius hat gelogen.	
//**************************************************************

INSTANCE DIA_Lord_Hagen_Cornelius		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_Cornelius_Condition;
	information	 = 	DIA_Lord_Hagen_Cornelius_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Корнелиус солгал.";
};

FUNC INT DIA_Lord_Hagen_Cornelius_Condition ()
{	
	if (Npc_HasItems (other,ItWr_CorneliusTagebuch_Mis) >= 1)
	&& (Cornelius_IsLiar == TRUE)
	&& (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Cornelius_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //Корнелиус солгал.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //Откуда тебе это известно?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //Вот, у меня его дневник. Все в нем.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //(в ярости) Ах, гнусная мразь!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //Перед лицом новых доказательств мне не остается ничего другого.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //Властью, данной мне королем и церковью, я провозглашаю...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //...что с заключенного Беннета снимаются все обвинения и он подлежит освобождению.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Корнелиус должен быть немедленно посажен под арест за лжесвидетельство.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //Можешь не беспокоиться. Корнелиус мертв.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //Значит, он уже понес заслуженное наказание. Отлично.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Он сбежал.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //Рано или поздно, он объявится. И тогда мы арестуем его.
		B_StartOtherRoutine (Cornelius,"FLED");
	}
	else 
	{
		B_StartOtherRoutine (Cornelius,"PRISON");
	};
	
	
	MIS_RescueBennet = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_RescueBennet);
	
	if (hero.guild == GIL_MIL)
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Твои дела спасли нас от бесчестья.
	};
};
//--------Hier endet der gesamte Befreie den Schmied Klumpatsch-------------




//**************************************************************
//	Auge Innos ganz!	
//**************************************************************

INSTANCE DIA_Lord_Hagen_AugeAmStart	(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	4;
	condition	 = 	DIA_Lord_Hagen_AugeAmStart_Condition;
	information	 = 	DIA_Lord_Hagen_AugeAmStart_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Я надел Глаз!";
};

FUNC INT DIA_Lord_Hagen_AugeAmStart_Condition ()
{	
	if (Kapitel <= 4)
	&& (MIS_ReadyForChapter4 == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_AugeAmStart_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //Я надел Глаз!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //(благоговейно) Ты носишь Глаз!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //И ты восстановил его!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //Значит ты Избранный Инноса!
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //Я должен отправляться в путь и убить всех драконов в Долине Рудников!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //Иди с Инносом и уничтожь Зло с его помощью!
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

INSTANCE DIA_Lord_Hagen_KAP4_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Antipaladine
///////////////////////////////////////////////////////////////////////

instance DIA_Lord_Hagen_ANTIPALADINE(C_INFO)
{
	npc		 	= 	PAL_200_Hagen;
	nr		 	= 	3;
	condition	 = 	DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information	 = 	DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Элитные воины орков нападают на наши земли.";
};

func int DIA_Lord_Hagen_ANTIPALADINE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)))
	&& (Hagen_SawOrcRing == FALSE)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};
var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //Элитные воины орков нападают на наши земли.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Я рассказал лорду Хагену о приближающихся ордах предводителей орков."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //Откуда у тебя такая информация?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //Я говорил с одним из них. Твое имя также упоминалось.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //Чушь. Мои люди не докладывали о массированном вторжении орков.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Возможно, какие-то их разведчики заблудились в близлежащих лесах.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //Это не разведчики. Я взял это кольцо с трупа одного из них.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Покажи.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Ммм. Это действительно неприятно.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //Это знак их силы. Значит, орки выбрались из-за своих частоколов и сражаются в открытом поле.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Я не видел, чтобы их было много. В основном, это их предводители и всего несколько бойцов.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //Да? Значит, они замышляют что-то еще. Это не похоже на орков, чтобы их лидеры в одиночку покидали свои защитные частоколы.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Но это может стать хорошей возможностью, впрочем, нанести им чувствительный удар.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Если они потеряют своих лидеров, их боевой дух резко снизится.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //У тебя новое задание, рыцарь. Иди и убей всех лидеров орков, каких найдешь в прилежащих землях.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //Принеси мне их кольца. Это будет серьезный удар по оркам.
			
			B_LogEntry (TOPIC_OrcElite,"Я смог принести Хагену кольцо предводителя орков в качестве доказательства. Он хочет, чтобы я принес ему все кольца предводителей, которые я найду."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Поговори с Ингмаром. Он может дать тебе несколько тактических советов по сражению с лидерами орков.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //Элитные воины орков - его специализация. Ему часто приходилось иметь с ними дело.
			B_LogEntry (TOPIC_OrcElite,"Ингмар очень много знает об элитных воинах орков."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //Одного твоего слова, что ты убил полководца орков, недостаточно для меня.
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Мне нужны вещественные доказательства, чтобы я мог принять меры.
		
			B_LogEntry (TOPIC_OrcElite,"Хаген отказывается верить мне. Он требует доказательств того, что элитные воины орков нападают на цивилизованные земли. Ну, меня бы удивило, если бы он повел себя по-другому."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info RingeBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_RINGEBRINGEN		(C_INFO)
{
	npc		 = 	PAL_200_Hagen;
	nr		 = 	5;
	condition	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Я могу еще кое-что сообщить о предводителях орков.";
};

func int DIA_Lord_Hagen_RINGEBRINGEN_Condition ()
{
	if (Hagen_SawOrcRing == TRUE)
	&& (Npc_HasItems (other,ItRi_OrcEliteRing) >= 1)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

var int OrkRingCounter;

func void DIA_Lord_Hagen_RINGEBRINGEN_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //Я могу еще кое-что сообщить о предводителях орков.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //Рассказывай.

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld fьr einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //Я могу дать тебе еще одно кольцо орков.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //Я могу дать тебе еще несколько колец орков.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Я горжусь тобой. Так держать!

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //Возможно, еще не все предводители орков уничтожены.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Но скоро мы поставим их на колени.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //Я удивлюсь, если ты еще их повстречаешь.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Ты можешь приносить мне их кольца, но я думаю, орки уже получили хороший урок.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Вот. Возьми это золото, купи себе на него хорошее снаряжение.

	OrcRingGeld	= (Ringcount * HagensRingOffer);	

	CreateInvItems (self, ItMi_Gold, OrcRingGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OrcRingGeld);
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

INSTANCE DIA_Lord_Hagen_KAP5_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************************
//		Die Drachen sind tot
//****************************************************************************

INSTANCE DIA_Lord_Hagen_AllDragonsDead(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_AllDragonsDead_Condition;
	information	= DIA_Lord_Hagen_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "Драконы мертвы.";
};                       
FUNC INT DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //Драконы мертвы.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //Я знал, что Иннос даст тебе силы, чтобы победить драконов!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //Как там с рудой?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Орки все еще осаждают замок в Долине Рудников. Гаронд не сможет покинуть замок, пока осада не снята.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //(в ярости) Черт!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Если Гаронд не способен справиться с ситуацией, я должен взять управление в свои руки.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //Кучка орков не остановит меня! Только не меня!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //Я уже отдал приказ своим людям. Мы готовимся выступать.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Мы ВСЕ отправимся туда. Я оставлю только минимальную охрану на корабле.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //Этого должно быть достаточно, чтобы, наконец, разделаться с этими орками!

	MIS_SCVisitShip = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"ShipFree");	
};

// ************************************************************
// 	  				   Ich brauche das Schiff
// ************************************************************

INSTANCE DIA_Lord_Hagen_NeedShip(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_NeedShip_Condition;
	information	= DIA_Lord_Hagen_NeedShip_Info;
	permanent	= FALSE;
	description = "Мне нужен корабль.";
};                       
FUNC INT DIA_Lord_Hagen_NeedShip_Condition()
{
	if (ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_NeedShip_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Мне нужен корабль.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //Он много кому нужен, солдат.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //(смеется) Я слышу это чуть ли не каждый день, дорогой. Но...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //У тебя даже нет капитана, не говоря уже о команде.
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //Как насчет корабля, стоящего в гавани?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Он принадлежит мне, и точка. Мы должны перевозить руду на этом корабле.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Когда мы покончим с этим, ты можешь обратиться ко мне опять.
};


// ************************************************************
// 	  				 Tor auf
// ************************************************************

INSTANCE DIA_Lord_Hagen_GateOpen (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_GateOpen_Condition;
	information	= DIA_Lord_Hagen_GateOpen_Info;
	permanent	= FALSE;
	description = "Орки ворвались в замок в Долине Рудников!";
};                       
FUNC INT DIA_Lord_Hagen_GateOpen_Condition()
{
	if (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_GateOpen_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //Орки ворвались в замок в Долине Рудников!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //О, Иннос! Что именно там произошло?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //Почему-то ворота оказались открытыми...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //Почему-то?! Но как это возможно... В замке наверняка есть предатель!
};

// ************************************************************
// 	  						 PERM
// ************************************************************

INSTANCE DIA_Lord_Hagen_Perm5 (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_Perm5_Condition;
	information	= DIA_Lord_Hagen_Perm5_Info;
	permanent	= TRUE;
	description = "Чего ты ждешь?";
};                       
FUNC INT DIA_Lord_Hagen_Perm5_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_Perm5_Info()
{	
	AI_Output (other,self, "DIA_Lord_Hagen_Add_15_33"); //Чего ты ждешь?
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //Мы все еще ждем груз со снаряжением и провизией. Как только он будет у нас, мы сразу же тронемся в путь!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Теперь, когда замок взят штурмом, нам нужно больше провизии.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //Но это не задержит нас надолго.
	};
};
