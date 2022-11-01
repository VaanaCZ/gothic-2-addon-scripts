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
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Ах. Хорошо, что ты пришел.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Что случилось?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Я нашел это в старой часовне.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //Это магическая руна. Я думаю, она может в любое время перенести тебя сюда, на ферму.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Я подумал, что ты сможешь пользоваться ей.
	
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
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Ты здесь, чтобы принести деньги Онару?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Я уже сказал тебе, что не надо творить глупости здесь.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Онар узнал, что ты успел заслужить себе дурную славу здесь.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Ну и естественно, он теперь хочет больше денег.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //Сколько?
			
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
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Я думал, ты умнее.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //Теперь хорошие новости для тебя.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //Неожиданно, не осталось никого, кто видел, как ты совершил убийство.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Никто теперь не может подтвердить, что видел, как ты воруешь.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Не осталось никого, кто ВИДЕЛ бы, как ты избил одного из фермеров.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Похоже, что все обвинения против тебя растворились в воздухе.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //Да уж, скажу тебе, это способ избавиться от подобных проблем.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Как бы то ни было, тебе больше не нужно платить.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Но будь осторожнее в будущем.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Ясно одно: ты должен, тем не менее, заплатить штраф полностью.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //Так как насчет этого?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"У меня нет столько золота!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Сколько там нужно?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Я хочу заплатить штраф!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Сколько там нужно?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"У меня нет столько золота!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Сколько там нужно?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Я хочу заплатить штраф!",DIA_Lee_PETZMASTER_PayNow);
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
	
	
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime hцher ist...
	
	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //Какого дьявола ТЕБЯ позволили пустить сюда? (удивленно) Это ТЫ новичок, от которого одни проблемы?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Я слышал от Горна, что ты все еще жив. Но что ты придешь сюда... А, ладно...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Хорошо, что ты все же пришел ко мне, пока твои дела не стали совсем паршивыми.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Наемники - крутые парни, и фермеры здесь тоже могут постоять за себя, но ты не можешь просто так убивать людей.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mцrder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //Не говоря уже о других твоих преступлениях здесь.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Я могу помочь тебе выбраться из этого дерьма.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //Это обойдется тебе в кругленькую сумму, впрочем. Онар жадный человек, и только если ОН закроет на все это глаза, вопрос можно будет считать улаженным.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Хорошо, что ты пришел. Я слышал, что ты что-то украл.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //И вышиб дух из нескольких фермеров.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //И убил несколько овец.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //Ты не можешь просто так творить подобное здесь. В таких случаях Онар настаивает, чтобы я наказывал преступников деньгами.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //Это означает: ты платишь, он набивает себе карман, но, по крайней мере, об этом деле можно будет забыть.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Если ты обвиняешься в дуэли с наемником, это одно...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //Но если ты избил фермера, они сразу бегут к Онару. И он ожидает определенных действий от меня.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Не говоря уже о том, что он приходит в бешенство, когда кто-то убивает овцу.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Ты должен заплатить штраф. Твои деньги переходят в карман Онару, но это единственный способ решить проблему.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getцtet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Онар ожидает от меня, что я буду защищать его ферму. Включая его овец.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Тебе придется заплатить ему компенсацию!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Сколько?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"У меня нет столько золота!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Я хочу заплатить штраф!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Я хочу заплатить штраф!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //Хорошо! Я прослежу, чтобы эти деньги дошли до Онара. Можешь считать эту проблему забытой.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //У меня нет столько золота!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //Тогда добудь его и поскорее.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Но я не думаю, что ты сможешь украсть его здесь, на ферме. Если тебя поймают, тебе так просто не отвертеться.
	
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
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //Какого дьявола ТЕБЯ позволили пустить сюда? (удивленно) Что ты делаешь здесь? Я думал, ты мертв!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //С чего ты так думал?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Горн сказал мне, что это ты разрушил Барьер.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Да, это действительно был я.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //Никогда бы не подумал, что человек может выжить после всего этого. Что привело тебя сюда? Ты же здесь не просто так...
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
	description = "Мне крайне необходимо поговорить с паладинами в городе ...";
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
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Мне крайне необходимо поговорить с паладинами в городе. Ты не мог бы помочь мне добраться до них?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(недоверчиво) Какие у тебя могут быть дела с паладинами?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //Это долгая история...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //У меня есть время.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(вздыхает) Ксардас дал мне задание. Он хочет, чтобы я заполучил мощный амулет, Глаз Инноса.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Значит, ты все еще в союзе с этим некромантом. Понятно. А этот амулет находится у паладинов, да?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //Насколько я знаю, да.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Я могу помочь тебе добраться до паладинов. Но сначала ты должен стать одним из нас.
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
	description = "Как ты можешь помочь мне добраться до паладинов?";
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
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //Как ты можешь помочь мне добраться до паладинов?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Доверяй мне. У меня есть план. Я думаю, ты как раз подходишь для него...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Я сведу тебя с паладинами, а ты окажешь мне услугу. Но сначала присоединись к нам!
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
	description = "А чем ты здесь занимаешься?";
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
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //А чем ты здесь занимаешься?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Это просто: я делаю все возможное, чтобы мы все смогли убраться с этого острова.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Онар нанял нас для защиты его фермы, и именно этим мы и намерены заниматься.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Но наша награда - нечто большее, чем просто плата за работу. Помогая фермерам, мы отрезаем город от провизии.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //А чем меньше паладины едят, тем скорее они прислушаются, когда, наконец, я сделаю им предложение о мире.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Плохо только, что тебе пришлось присоединиться именно к ним.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //Что за предложение ты хочешь сделать?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //Естественно, условием будет наше помилование и свободный путь на материк. Ты все узнаешь, когда придет время.
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
	description = "Я хочу присоединиться к вам!";
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
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Я хочу присоединиться к вам!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Я надеялся, что ты скажешь это! Нам здесь нужны каждые надежные руки.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //От последних наемников, что я нанял, не было никакого толку, одни проблемы!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //В принципе, ты можешь приступать прямо сейчас. Ну, правда есть парочка вопросов, которые нужно урегулировать, но, я думаю, это не будет проблемой...
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
	description = "Что нужно 'урегулировать' прежде чем я смогу присоединиться к вам?";
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
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Что нужно 'урегулировать' прежде чем я смогу присоединиться к вам?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Нас нанимает Онар, лендлорд. Ты можешь находиться на ферме только с его одобрения.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //Также, дело еще в наших парнях. Я смогу принять тебя, только если большинство наемников согласится, что ты можешь присоединиться к нам.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Но не ходи к Онару пока все не будет улажено. Он очень раздражительный тип...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Чтобы быть принятым в ряды наемников, я должен получить одобрение Онара, после того, как заручусь одобрением наемников.");
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
	description = "Как мне убедить наемников проголосовать за меня?";
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
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Как мне убедить наемников проголосовать за меня?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Делая то, что ожидается от тебя, когда ты будешь наемником, я бы сказал.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Поговори с Торлофом. Он обычно находится перед домом. Он даст тебе испытание.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Если ты сможешь пройти его, ты завоюешь большую часть необходимого уважения.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Он расскажет тебе обо всем, что тебе нужно знать.
	
	B_LogEntry (TOPIC_BecomeSLD,"Чтобы быть принятым в ряды наемников, я должен пройти испытание Торлофа и заслужить уважение остальных наемников.");
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

	description	 = 	"Что ты знаешь о Кольце Воды?";
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
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Что ты знаешь о Кольце Воды?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(смеется) Я так и знал! Тебе просто необходимо всюду сунуть свой нос!
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //Ну давай, говори.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Сказать я могу немного. Я знаю, что это тайное общество существует и что управляют им маги воды.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Я больше не связан соглашением с магами воды, которое мы заключили с ними в те времена, когда еще стоял Барьер. 
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Конечно, если я могу чем-то им помочь, я это делаю. Но большую часть времени я занят своими делами. Ни на что другое времени не остается.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Если ты хочешь узнать об этом обществе больше, поговори с Кордом. Насколько я знаю, он один из них.
		
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
	description = "Я готов присоединиться к вам!";
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
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Я готов присоединиться к вам!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Сначала ты должен пройти испытание Торлофа.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Так ты прошел испытание Торлофа?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Да.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //Это хорошо.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //А что говорят другие наемники?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Я не уверен, достаточно ли наемников на моей стороне.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //Тогда поговори с Торлофом, он знает обо всем, о чем говорят на этой ферме.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //Большинство из них на моей стороне.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //Хорошо, тогда иди прямо к Онару. Я уже переговорил с ним.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Но ты должен договориться  о своем жаловании сам.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Все, что мне нужно теперь - это одобрение Онара.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Ты беседовал с Онаром?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Он согласился.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //Тогда добро пожаловать в наши ряды, приятель!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Вот, возьми для начала эти доспехи!
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
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Я рад, что ты с нами.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //У меня уже есть первое поручение для тебя.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Оно имеет отношение к паладинам. Пришло время тебе увидеться с ними.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //Ты все равно хотел туда идти.
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
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Я вижу, ты поступил на службу к паладинам.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //Ты постригся в монастырь? (смеется) Я всего ожидал, только не этого.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //Что ж, теперь ты не сможешь стать наемником.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Но кто знает, может быть, ты сможешь сделать что-нибудь для меня - или я для тебя.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Посмотрим. Но, как бы то ни было я желаю тебе всего наилучшего.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Но даже и не думай обвести меня вокруг пальца, понял?
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
	description = "И как мне теперь добраться до паладинов?";
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
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //И как мне теперь добраться до паладинов?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //Очень просто. Ты отнесешь им наше предложение о мире.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Я знаю лорда Хагена, командующего паладинов, со времен моей службы в королевской армии.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Я знаю, о чем он думает - у него недостаточно людей. Он примет это предложение. По крайней мере, он выслушает тебя.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Я написал ему письмо - держи.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //В любом случае, это должно тебе позволить получить аудиенцию у командующего паладинов.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Ли отправляет меня к лорду Хагену с предложением мира. Так я могу добиться аудиенции у паладинов.");
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
	description = "Я отнес лорду Хагену твое предложение о мире.";
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
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Я отнес лорду Хагену твое предложение о мире.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //Что он сказал?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Он сказал, что он готов даровать помилование тебе, но не твоим людям.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Вот упрямый дурак. Большинство людей в КОРОЛЕВСКОЙ армии большие головорезы, чем мои парни.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Что ты собираешься делать теперь?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Я должен найти другой способ вытащить нас отсюда. Если понадобится, мы захватим корабль. Мне нужно подумать об этом.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Вытащить свою голову из петли и бросить моих людей - это даже не обсуждается.

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
	description = "Почему ты так рвешься на материк?";
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
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Почему ты так рвешься на материк?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Как ты знаешь, я был генералом в армии короля.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Но его лизоблюды предали меня, потому что я знал кое-что, чего не должен был знать.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Они засунули меня в эту колонию, и король позволил это.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //У меня было много свободного времени, чтобы все обдумать.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Я должен отомстить.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(изумленно) Королю?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(решительно) Королю! И его прихвостням. Они все горько пожалеют  о том, что сделали со мной...
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
	description = "Я собираюсь отправиться в Долину Рудников.";
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
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Я собираюсь отправиться в Долину Рудников.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Я и не надеялся, что ты долго задержишься на этой ферме.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //Если ты возвращаешься в колонию, поищи там Горна. Паладины держат его там за решеткой.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Горн хороший человек, и он бы очень пригодился мне здесь, так что если у тебя появится шанс освободить парня, не упускай его.
	
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
	description = "Я освободил Горна.";
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
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //Я освободил Горна.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Да, он уже рассказал мне об этом. Отлично сработано.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Он стоит больше, чем Сильвио и все его парни вместе взятые.
	
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
	description = "Горн сказал тебе обо мне? Что произошло с ним?";
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
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Горн сказал тебе обо мне? Что произошло с ним?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Ты ведь помнишь его, да?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Дай попытаюсь вспомнить...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Конечно.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Конечно.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Его поймали паладины и отправили назад, в Долину Рудников с конвоем каторжников.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Если бы дорога в Долину Рудников не кишела паладинами и орками, я бы уже отправил пару своих парней, чтобы освободить его.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Но сейчас это абсолютно неосуществимо. Бедняга.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Дай попытаюсь вспомнить...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Большой, черноволосый, плохой парень с большим топором, он отбил нашу шахту с твоей помощью. Это было в колонии.
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
	description = "У Онара теперь на несколько овец меньше благодаря Булко...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //У Онара теперь на несколько овец меньше благодаря Булко...
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //Ох, не приставай ко мне с такой чепухой! У меня и без этого проблем хватает.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //У меня тоже. Булко, похоже, видит проблему во мне. Он хочет, чтобы я покинул ферму...
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //Да, и что? Постой за себя.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //Ты можешь сказать ему, что он должен вести себя сдержаннее, или я вычту пропавших овец из его жалования...
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
	description = "Я пришел из Долины Рудников ...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Я пришел из Долины Рудников. Замок, находящийся там, был атакован драконами!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //Так это правда! Ларес говорил, что в городе циркулируют слухи о драконах... Я не поверил в это...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //А что насчет паладинов?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Они понесли большие потери.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //Хорошо! Может теперь лорд Хаген более взвешенно подумает о моем предложении...
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //А если нет... (жестко) Тогда мы найдем другой способ вырваться отсюда...
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //Хорошо! Может, это заставит лорда Хагена отправиться со своими людьми в Долину Рудников...
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Чем меньше паладинов останется здесь, тем лучше.
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
	description = "А как насчет доспехов получше?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //А как насчет доспехов получше?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Ты выполнил задание.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //У меня есть достойные доспехи для тебя. Конечно, если ты кредитоспособен.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Торлоф получил задание от Онара, которое должно было быть выполнено уже давным-давно.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Сначала реши этот вопрос, а затем мы поговорим о достойных доспехах!
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
	description = "Купить средние доспехи наемника. Защита: оружие 45, стрелы 45. Цена: 500 золота";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Дай мне эти доспехи.
	
	if (B_GiveInvItems (other, self, itmi_gold, 500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Держи. Это очень хорошие доспехи.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Но это не подарок! Сначала я хочу увидеть золото!
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
	description = "У тебя есть доспехи получше для меня?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //У тебя есть доспехи получше для меня?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Конечно.
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
	description = "Купить тяжелые доспехи наемника. Защита: оружие 60, стрелы 60. Цена: 1000 золота";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Дай мне тяжелые доспехи.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Держи. Это очень хорошие доспехи. Я сам такие ношу.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Ты знаешь правила. Сначала золото!
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
	description = "У тебя нет еще для меня работы?";
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
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //У тебя нет еще для меня работы?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Тебе все мало, да? По-моему, у тебя и без того проблем хватает. Чего же еще тебе нужно?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Еще задание. Я же наемник, помнишь?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //Хорошо. У меня есть кое-что. Как раз для тебя.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Я должен поквитаться с судьей в городе.  Я бы, конечно, предпочел сделать это сам.
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //Но паладины и на пушечный выстрел не подпустят меня к его дому.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Это дело очень деликатное. Так что слушай внимательно. Ты пойдешь к судье и предложишь ему свои услуги.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Ты должен попытаться завоевать его доверие и выполнять всякую грязную работу, пока не найдешь что-нибудь, дискредитирующее его.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Эта свинья провернула столько грязных делишек, что от него смердит за версту.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Дай мне что-нибудь, что я смогу использовать, чтобы запятнать его имя перед лицом ополчения. Я хочу, чтобы он провел остаток своих дней за решеткой.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //Но я не хочу, чтобы ты убивал его. Это для него слишком мало. Я хочу, чтобы он страдал, понимаешь?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //Как ты думаешь, справишься?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Ли хочет, чтобы я нашел доказательства, обвиняющие судью Хориниса. Для этого, я должен предложить свои услуги судье и должен держать ушки на макушке."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Я не буду заниматься этим.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Нет проблем. Сколько?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Нет проблем. Сколько?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Твоя награда зависит от того, что ты сообщишь мне. Так что постарайся.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Я не буду заниматься этим. Я не хочу прислуживать этой свинье.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //Не нервничай так. Помни о том, что именно он засадил тебя за решетку и засунул за Барьер. Или ты забыл это?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Поступай, как знаешь, но я надеюсь, ты примешь правильное решение.
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

	description = "Я нашел кое-что, дискредитирующее судью.";
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
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Я нашел кое-что, дискредитирующее судью.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Правда? И что же?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Он нанял головорезов, чтобы те ограбили губернатора Хориниса.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Вскоре после этого он арестовал их и забрал себе все золото.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Я принес тебе в качестве доказательства письменный приказ судьи этим головорезам.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Покажи.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Наконец-то. Этого должно быть достаточно, чтобы заставить его страдать. Я восхищен.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Я готов хорошо заплатить за это. Держи свою награду.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //И не говори об этом никому, хорошо?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //Это потрясающе. Но вопрос решился сам собой. Судья мертв.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Какой-то идиот прикончил его. Ох, да. Меня это тоже, в общем-то, устраивает.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Вот несколько монет. Эта бумажка сейчас большего не стоит.
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
	description = "Что насчет Беннета?";
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
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //Что насчет Беннета?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Так ты уже знаешь. Эти ублюдки посадили его за решетку. Вот и все.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Как будто мне не хватает проблем с моими людьми - теперь я должен заботиться еще и о паладинах.
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
	description = "Что ты собираешься сделать для Беннета?";
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
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Что ты собираешься сделать для Беннета?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Я пока не знаю. Часть парней готовы хоть сейчас ворваться в город и вбить зубы лорду Хагену по самые гланды.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //К счастью, у нас недостаточно людей для такой операции, и, кроме того, это не в моем стиле.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //То есть ты собираешься сидеть сложа руки?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //Конечно нет.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Если я не смогу доказать невиновность Беннета достаточно быстро, Ли ничего не может гарантировать. Его люди могут не выдержать и напасть на город в любой момент, чтобы освободить Беннета."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Ларес все еще в городе и пытается выяснить, как можно вытащить Беннета.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //А пока я попытаюсь успокоить моих парней. Остается надеяться, что Ларесу не понадобится слишком много времени на это.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //Ох, да. Чуть не забыл... Бастер хочет поболтать с тобой. Он не говорит мне, о чем. Может, тебе стоит найти его?
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
	description = "Могу я как-нибудь помочь с Беннетом?";
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
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Могу я как-нибудь помочь с Беннетом?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Конечно, но помни, что в таком деле нужен трезвый ум и холодный расчет.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Иннос свидетель, горячих идиотов здесь и так хватает.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Иди в город, может, тебе удастся найти способ вытащить Беннета оттуда.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Но не затягивай сильно с этим делом, я не знаю, как долго мне удастся удерживать парней под контролем.
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
	description = "Есть новости о Беннете?";
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
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Есть новости о Беннете?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Ну, по крайней мере, тюрьма, похоже, не сильно сказалась на его здоровье.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Отличная работа.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Нет, мы все еще знаем недостаточно.
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

	description	 = 	"Что произошло за последнее время?";
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
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Что произошло за последнее время?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Сильвио, ублюдок, прослышал о драконах в Долине Рудников и свел с ума всех здесь на ферме баснями о них.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Он пытался уговорить парней пойти с ним в Долину Рудников. Он обещал им славу, почет, золото и еще кучу всяческих благ.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Большинство не особенно воодушевилось идеей быть убитым ради Сильвио, но все же нашлось несколько идиотов, которые клюнули на его наживку.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Все закончилось тем, что они вооружились у Беннета, а затем свалили.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(облегченно) Ах. Откровенно говоря, я даже рад, что Сильвио наконец ушел с фермы.
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
	description	 = 	"Ты можешь обучить меня?";
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
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Ты можешь обучить меня?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Я могу показать тебе, как сражаться двуручным оружием.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Но у меня нет времени на то, чтобы учить тебя основам.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Как только ты достигнешь определенного уровня, я в твоем распоряжении. А пока поищи другого учителя.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //Я слышал, что ты очень хорош. Но готов поспорить, что я все же могу научить тебя парочке-другой приемов.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Ли может обучить меня искусству обращения с двуручным оружием.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Так что, если хочешь, я могу потренировать тебя. Впрочем, не бесплатно.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Сколько?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 монет - и считай, что мы договорились.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"Это слишком дорого для меня.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Договорились. Вот золото.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //Это слишком дорого для меня.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Подумай на досуге. Учителя моего калибра встречаются нечасто.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //Договорились. Вот золото.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //Хорошо, поверь мне: я стою этих денег.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Ли может обучить меня искусству обращения с двуручным оружием.");
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
	description = "Начнем обучение.";
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
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Начнем обучение.
	
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
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Теперь ты настоящий мастер боя двуручным оружием.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Ты больше не нуждаешься в учителях.
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
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Теперь ты настоящий мастер боя двуручным оружием.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Ты больше не нуждаешься в учителях.
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

	description	 = 	"Люди-ящеры раскладывают драконьи яйца по всему острову.";
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
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Люди-ящеры раскладывают драконьи яйца по всему острову.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Я мог понять это раньше. Пришло время убираться отсюда.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //А что мне делать с ними?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Разбей их. Что еще?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Может быть, из скорлупы можно будет сделать доспехи или еще что-нибудь.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Похоже, они очень крепкие. Поговори об этом с Беннетом.
		B_LogEntry (TOPIC_DRACHENEIER,"Ли не знает, что делать с драконьим яйцом. Он отправил меня к кузнецу Беннету."); 
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
	description = "Как идут дела на ферме?";
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
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Как идут дела на ферме?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //Ну, с тех пор как Сильвио свалил, здесь стало довольно спокойно.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //По-моему, это тоже неплохо.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Но, к сожалению, у нас не стало меньше работы. Парни все чаще и чаще выражают недовольство, им теперь приходится работать еще и за людей Сильвио.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Но это мои проблемы. Я справлюсь.
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
	
	description	 = 	"Ты не знаешь, как мне захватить корабль паладинов?";
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
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Ты не знаешь, как мне захватить корабль паладинов?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //Ты думаешь, я все еще сидел бы здесь, если б знал? Этот корабль охраняют сильнее, чем транспорты с рудой в старой колонии.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Должен же быть способ попасть на корабль.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Конечно. Попасть на борт просто.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Ты же знаешь, у нас судья под каблуком. Ты должен пойти к нему и вытянуть из него официальное письмо, которое позволит нам попасть на корабль.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Ли полагает, что лучший способ попасть на корабль паладинов - получить письмо о соответствующих полномочиях от судьи. Но ряд ли он даст такое письмо по своей доброй воле.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //У меня есть поддельное письмо о предоставлении полномочий. Увидев его, корабельная стража позволит тебе пройти.
		
			B_LogEntry (TOPIC_Ship,"Ох, старина Ли! Он раздобыл поддельное письмо, которое позволит мне попасть на корабль паладинов.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Но это не все. Чтобы управлять кораблем, тебе понадобится капитан, команда и много чего еще.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Нужно проделать очень большую работу.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "А кого мне взять в команду?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Ты знаешь кого-нибудь, кто мог бы управлять кораблем?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Ты знаешь кого-нибудь, кто мог бы управлять кораблем?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Насколько я знаю, Торлоф ходил в море. Он разбирается в морском деле.

	B_LogEntry (TOPIC_Captain,"Торлоф - старый морской волк. Возможно, он захочет стать моим капитаном.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //А кого мне взять в команду?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //Это ты должен решить сам. Но я бы взял только людей, которым доверяю. Ты много знаешь людей, которым можно доверять?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Если тебе нужен кузнец в команде, попробуй уговорить Беннета. Лучше него ты вряд ли найдешь.

	B_LogEntry (TOPIC_Crew,"Что касается моей команды, здесь Ли мало чем может помочь мне. Но все же он дал совет - набирать только людей, которым я могу доверять. Я, пожалуй, спрошу Беннета, может быть, ему это будет интересно.");
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

	description	 = 	"Письмо сработало.";
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
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //Письмо сработало. Корабль теперь мой. Судья оказался очень кстати.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //Хорошо. Значит, все твои унижения перед этим ублюдком были не напрасными.
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
	description	 = 	"Я хочу украсть корабль.";
};

func int DIA_Lee_StealShip_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)	//Joly: kein Richter Erpressen nцtig!
	{
		return TRUE;
	};	
};

func void DIA_Lee_StealShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Я хочу украсть корабль.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //И как ты собираешься сделать это?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //Легче легкого - я пойду туда, покажу им твои бумаги - и корабль мой!
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Ну-ну. Держи, надеюсь, ты знаешь, что делаешь.
	
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
	description	 = 	"Ты пойдешь со мной на корабле?";
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
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Ты пойдешь со мной на корабле?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //Ты шутишь? Конечно. Мне не терпится поквитаться кое с кем на материке.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //Кроме того, я могу обучить тебя искусству владения одноручным и двуручным оружием. Это может оказаться очень полезным.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Ли не терпится увидеть материк вновь. Он предложил мне свою поддержку. Мне будет сложно найти такого учителя боевых искусств где либо еще.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Все места на корабле сейчас заняты, но я вернусь, если появится какая-нибудь вакансия.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Я дам тебе знать, если ты мне понадобишься.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Пакуй свои вещи!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //Пакуй свои вещи!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Что? Прямо сейчас?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Да, я скоро отправляюсь в путь, и если ты плывешь со мной, приходи в гавань. Встретимся на корабле.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //Я так долго ждал этого момента. Я буду там.
	
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
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Я дам тебе знать, если ты мне понадобишься.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //Надеюсь, ты знаешь, что делаешь. Но помни, что хороших бойцов никогда не бывает слишком много.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //(ухмыляется) Если это только не полные кретины вроде Сильвио.

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
	description	 = 	"Я все-таки не могу взять тебя с собой!";
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
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Я все-таки не могу взять тебя с собой!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Как скажешь. Ты знаешь, где меня найти, если что!
	
	Lee_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};


///////////////////////////////////////////////////////////////////////
//	Ich habs mir ьberlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StillNeedYou_Condition;
	information	 = 	DIA_Lee_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ты мне все-таки нужен!";
};
func int DIA_Lee_StillNeedYou_Condition ()
{	
	if ((Lee_IsOnBOard == LOG_OBSOLETE)		//Hier braucht man natьrlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lee_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Ты мне все-таки нужен!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Я знал, что понадоблюсь тебе! Увидимся на корабле.
		
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
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Знаешь, а не пошел бы ты! Сначала ты сказал, чтобы я пришел, затем отправил меня назад!
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //Найди себе другого идиота!
	
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



































