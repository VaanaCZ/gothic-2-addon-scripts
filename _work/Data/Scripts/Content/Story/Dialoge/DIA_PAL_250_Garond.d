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
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Мы ничего не будем обсуждать, пока ты не заплатишь штраф.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //А он возрос, учитывая все последние обвинения.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Проблем у тебя, похоже, только прибавилось.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Но я надеюсь, что  ты способен заплатить сразу за все! Учитывая все твои прегрешения, это будет...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Я очень разочарован тобой. Твой штраф теперь составляет...
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
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Выяснились новые подробности.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Теперь больше никто не обвиняет тебя в убийстве.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Никто не помнит, что видел, как ты воровал.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //Больше нет свидетелей, утверждающих, что ты участвовал в драке.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Похоже, все обвинения против тебя сняты.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Я понятия не имею, что там произошло, но предупреждаю тебя: не заходи слишком далеко!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Я принял решение освободить тебя от штрафа.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //И больше я не хочу слышать о том, что ты сеешь смуту в замке!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Я хочу довести до твоего сведения: тебе все равно придется заплатить штраф в полном объеме.
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //Так как насчет этого?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"У меня нет столько золота!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Сколько там нужно?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Я хочу заплатить штраф!",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Сколько там было?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"У меня нет столько золота!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Сколько там нужно?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"Я хочу заплатить штраф!",DIA_Garond_PETZMASTER_PayNow);
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
	Garond_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime hцher ist...
	
	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Так это ты сеешь смуту в замке.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //Я спрашивал себя: сколько это еще будет продолжаться, прежде чем ты придешь ко мне с повинной?
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Еще только убийств мне здесь не хватало.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //У меня на счету каждый человек - а теперь у меня стало на одного бойца меньше!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS Mцrder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //Не говоря уже обо всем остальном, в чем тебя обвиняют.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Позволь мне объяснить тебе  кое-что. Мы здесь все в одной ловушке.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //И у меня на счету каждый человек. Включая тебя.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Если тебе хочется убить кого-нибудь, просто выйди за ворота замка. И убивай там орков себе на здоровье.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Я вынужден наложить на тебя штраф - и мне крайне неприятно применять такие меры.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Ходят слухи, что ты шарил в чужих вещах.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //Не говоря уже обо всем другом, что мне доносили.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Тебе так просто не уйти от ответственности. Ты, похоже, не понимаешь всей серьезности ситуации.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Тебе придется заплатить штраф в качестве компенсации за твои преступления!
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Я не люблю, когда среди моих людей случаются драки.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //А уж этот случай с овцой мне совсем не понятен.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Тебе придется заплатить за это штраф!
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf getцtet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Ты убиваешь наших овец?! Это общественная собственность.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Тебе придется заплатить за это мясо.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Сколько?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"У меня нет столько золота!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Я хочу заплатить штраф!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Я хочу заплатить штраф!
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Хорошо, я скажу об этом нашим парням, чтобы немного успокоить их. Но чтобы больше такое не повторялось!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //У меня нет столько золота!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //Тогда постарайся раздобыть это золото как можно быстрее.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //И я предупреждаю тебя: если ты будешь совершать подобные преступления и в будущем, цена возрастет!
	
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
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Откуда ты взялся? Ты не из старателей, и ты не один из моих людей. Так кто же ты?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Я пришел через Проход.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //Через Проход...? Ты действительно прошел там?! О, Иннос всемогущий!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Зачем ты прошел этот путь, маг?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Какой приказ ты выполняешь, солдат?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Я задаю себе вопрос, зачем наемнику проделывать такой путь? Что ты делаешь здесь?
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
	description = "Я пришел от лорда Хагена.";
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
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Я пришел от лорда Хагена. Он хочет, чтобы я представил ему доказательства присутствия здесь драконов.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //Так ты пришел, чтобы получить эти доказательства и исчезнуть опять?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //Да, именно на это я и рассчитывал.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //Так ему нужны доказательства? Он может получить их. Но я не могу отправить тебя назад к лорду Хагену, не предоставив ему информацию о руде.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //Послушай - лорд Хаген должен узнать все о ситуации здесь и о том, сколько руды удалось нам добыть.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //Хорошо, и что ты хочешь, чтобы я сделал?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //У нас здесь, в долине, три отряда старателей. Но я еще не получил от них ни одного куска руды.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Посети все три шахты и доложи мне, сколько руды они добыли.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //После этого, я дам тебе письмо, которое ты отнесешь лорду Хагену.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Ну, хорошо - похоже, у меня нет выбора.
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Прежде чем командующий Гаронд отправит меня назад, он хочет, чтобы я разыскал три группы старателей и сообщил ему, сколько руды удалось им добыть.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Командующий Гаронд дал мне поручение. Он отправил три группы старателей добывать магическую руду. И до сих пор они не вернулись.");
	B_LogEntry (TOPIC_ScoutMine,"Я должен найти эти три группы старателей и выяснить, сколько руды удалось им добыть.");

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
	description = "Но почему именно я?";
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
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Но почему именно я?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Потому что ты знаешь как пробираться через ряды орков. Мои парни только зря отдадут свои жизни.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //Ведь тебе один раз уже удалось преодолеть все препятствия - значит, ты как нельзя лучше подходишь для этой работы.
};
// ************************************************************
// 			Ausrьstung
// ************************************************************

INSTANCE DIA_Garond_Equipment (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Equipment_Condition;
	information	= DIA_Garond_Equipment_Info;
	permanent	= FALSE;
	description = "Мне нужно снаряжение.";
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
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Мне нужно снаряжение.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Поговори с магом Милтеном здесь, в замке. Он разбирается в таких вещах.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Поговори об этом с Тандором. Он выдаст тебе все необходимое.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Тандор продает оружие в замке.");
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
	description = "Сколько ты заплатишь мне за эту работу?";
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
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Сколько ты заплатишь мне за эту работу?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //(сердито) Я не торгуюсь с вами, наемниками.
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Ох, ладно, похоже, у меня нет выбора. Я заплачу тебе 500 золотых, если ты выполнишь мое задание.
};
// ************************************************************
// 	Wo finde ich die Schьrfstellen?
// ************************************************************

INSTANCE DIA_Garond_Wo (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Wo_Condition;
	information	= DIA_Garond_Wo_Info;
	permanent	= FALSE;
	description = "Где мне найти эти шахты?";
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
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //Где мне найти эти шахты?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Вот, возьми эту карту. На ней показаны две области, где находятся шахты.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Если у тебя есть еще вопросы, обратись к Парсивалю. Он расскажет все, что тебе нужно знать о старателях.
	
	B_LogEntry (TOPIC_ScoutMine,"Паладин Парсиваль может дать мне информацию о старателях.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Черт! Что там происходит? Неужели сам Белиар явился, чтобы стереть нас с лица земли?!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Мои люди почти все мертвы, а с той рудой, что у нас есть, мы НЕ МОЖЕМ ОСТАНОВИТЬ ДАЖЕ ОДНОГО ОРКА, НЕ ГОВОРЯ УЖЕ ОБ АРМИИ!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Эта экспедиция обречена на провал.
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
	description = "Я поговорил с Фаджетом.";
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
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //Я поговорил с Фаджетом.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Что он может сказать мне?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Его люди добыли два ящика руды.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Хмм... два ящика? Мне не нужны два ящика - мне нужно ДВЕ СОТНИ.
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Он хочет, чтобы я передал тебе - ему нужны еще люди.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Что? Я должен послать еще людей на верную смерть? Он может забыть об этом.
 	
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
	description = "Насчет шахты Сильвестро...";
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
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Насчет шахты Сильвестро...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Ты видел его? Ты говорил с ним?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Все, кто находился в шахте, мертвы. Растерзаны краулерами.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //А что насчет руды? Ты знаешь, сколько они добыли?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Им удалось спрятать несколько ящиков. Они в пещере - по пути от замка к шахте.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Черт! Это были хорошие люди - да проявит Иннос милосердие к их душам.
	
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
	description = "Я встретил Маркоса.";
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
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //Я встретил Маркоса.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //И? Что он может доложить? Сколько руды он добыл для нас?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Четыре ящика. Он покинул шахту, чтобы переправить руду в безопасное место.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Теперь он охраняет эти ящики в небольшой долине за позициями орков. Он просит прислать подкрепление.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Что? Всего четыре ящика - и он покинул шахту? Черт, как это все плохо.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //И ему нужны еще люди?.. Что ж, ладно, я пошлю к нему двух человек.
	
	
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
	description = "Что насчет письма для лорда Хагена?";
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
	AI_Output (other,self ,"DIA_Garond_Success_15_00"); //Что насчет письма для лорда Хагена?
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //В общей сложности у нас есть десять ящиков руды - и мы потеряли в два раза больше хороших людей.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Ты получишь свое письмо. Лорд Хаген ДОЛЖЕН услышать об этом. Эта долина проклята - здесь царствует Зло.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Командующий Гаронд дал мне письмо. Его должно быть достаточно для подтверждения моих слов. Я могу отнести его лорду Хагену.");
	
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
	description = "Как насчет оплаты?";
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
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //Как насчет оплаты?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //Ох, да, точно. Я должен тебе немного золота. Вот твоя награда.
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
	description = "Как ситуация?";
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
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Как обстановка?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Теперь я жду только новостей с последней шахты - и надеюсь, что это будут хорошие новости.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Мне нужны доклады о двух других шахтах. А там посмотрим.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Ты должен найти наши шахты. Мне очень нужны новости о том, как обстоят дела с добычей руды.
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
	description = "Я хочу, чтобы ты освободил Горна.";
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
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Я хочу, чтобы ты освободил Горна.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //Я не могу отпустить его. Он совершил слишком много преступлений и должен поплатиться за это.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Могу я заплатить штраф за него?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //Это возможно - но обойдется тебе очень недешево. Я хочу получить за Горна 1000 золотых.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //Это огромная сумма.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //Вина Горна тоже не маленькая. Принеси мне это золото, и я освобожу его.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Гаронд требует тысячу золотых монет за освобождение Горна.");
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
	description = "Я хочу купить свободу Горну. (Заплатить 1000 монет)";
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
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Я хочу купить Горну свободу.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //Хорошо. Ты можешь пойти к Герольду и сказать ему, что я приказываю освободить Горна.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Я заплатил Гаронду. Теперь я могу освободить Горна из темницы. Стражник Герольд не будет препятствовать.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //Тогда принеси мне 1000 золотых монет.
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
	description = "Что ты планируешь делать дальше?";
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
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Что ты планируешь делать дальше?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Я уже все перепробовал. Ты - моя единственная надежда, что лорд Хаген пришлет мне подкрепление.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Но мы не падем духом и будем молиться Инносу, чтобы он не оставил нас без своей поддержки в этот мрачный час.
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
	description	 = 	"Что нового?";
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
	AI_Output (other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //Что нового?
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Черт. Что ты тут ошиваешься? Мне нужно подкрепление!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Даже Милтен покинул замок. Но мне не нужно несколько человек - мне нужно БОЛЬШОЕ подкрепление!
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
	description	 = 	"Я вернулся.";
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
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Я вернулся.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //Я сам это вижу. А что насчет подкрепления?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Лорд Хаген прибудет, как только со всем разберется. Столько всего произошло.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //Меня это не волнует. Мне нужны войска. Орки все прибывают и прибывают. Нам не продержаться долго.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Мои люди измотаны, и у нас заканчивается провизия.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Прибыли волонтеры.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Ты имеешь в виду себя и твоих друзей, охотников на драконов, что ли? Вы, конечно, можете помочь нам, но вас слишком мало.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Ты имеешь в виду охотников на драконов? Они, конечно, могут помочь нам, но их слишком мало.
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Если Хаген не пришлет в ближайшее время своих людей, я ничего не могу гарантировать.

	B_InitNpcGlobals ();//Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	//-----------------------------------------
	AI_Teleport 		 (DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");	
	B_StartOtherRoutine 	(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;


	// Die Drachenjдger vom Spielstart verziehen sich in ihr Lager.
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
	description	 = 	"Насчет драконов ...";
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
	B_LogEntry (TOPIC_DRACHENJAGD,"Гаронда по долгу службы должно интересовать, как обстоят дела с драконами, хотя мне кажется, ему на это наплевать."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //У меня есть новости о драконах.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Докладывай.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Я убил дракона в болоте к востоку отсюда.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Дракон в каменной крепости, к югу отсюда, мертв.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Огненный дракон из вулкана на юге больше не будет беспокоить вас.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Я был в западном ледяном районе и расправился с драконом, обитавшем там.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //Это хорошие новости. Вот. Возьми эти деньги. Надеюсь, они помогут тебе обновить свое снаряжение.
		
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
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Ты можешь еще что-нибудь рассказать о драконах?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Мне нужно заниматься другими делами. Пусть мой помощник-стратег Орик расскажет тебе об этом.
		B_LogEntry (TOPIC_DRACHENJAGD,"У офицера Гаронда, отвечающего за стратегию, Орика, возможно есть полезная информация для меня."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Последнее время были еще нападения драконов?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //По счастью, нет. В настоящий момент они держатся вдалеке.
	};
};

//*********************************************************************
//	Ich habe alle drachen getцtet
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
	description	 = 	"Все драконы мертвы.";
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
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Все драконы мертвы.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //(недоверчиво) Все? То есть зло изгнано отсюда навеки?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Нет. Остался их предводитель.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Разве не драконы были предводителями орков?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Да, это так, но у них также есть свой хозяин. Мы должны уничтожить и его тоже.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Я, к сожалению, ничем не могу тебе помочь. Я должен охранять руду, а эти проклятые орки, кстати, тоже все еще здесь.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Тебе придется сделать это самому.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Да защитит тебя Иннос.
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
	description	= 	"Я хочу поговорить о кузнеце.";
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
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //Я хочу поговорить о кузнеце.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Каком кузнеце? Он исчез.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //Он что вернулся? Тогда можешь сказать ему...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Нет, я говорю о Яне.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //Он охотник на драконов, как и я, и хороший кузнец.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Одном из охотников на драконов. Он кузнец.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //Это хорошо. Наш предыдущий кузнец слинял, трус.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Ян хотел бы поработать в кузнице.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Понимаю. Так ты думаешь, я могу доверять ему?
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Да.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Если ты так уверен, то ты можешь поручиться за него.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Если из-за него возникнут проблемы, за это ответишь ты. Согласен?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Я подумаю над этим.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Я ручаюсь за Яна.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Я подумаю над этим.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Как я могу доверять ему, если даже ты сомневаешься в нем?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Если за него никто не сможет поручиться, этот Ян на пушечный выстрел не подойдет к кузнице.

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Я ручаюсь за Яна.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Хорошо. Он может работать в кузнице. Но, конечно же, он должен обеспечивать моих людей мечами.
	
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

	description	 = 	"Как ситуация?";
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
	AI_Output			(other, self, "DIA_Garond_PERM5_15_00"); //Как обстановка?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Что за бардак! Какой-то ублюдок оставил открытыми главные ворота. Теперь мы остались совсем без защиты.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Ну, доберусь я до этого предателя...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Мы все здесь помрем как мухи, если Хаген не прибудет как можно скорее.
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
































