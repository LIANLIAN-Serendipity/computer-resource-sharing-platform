/*
 Navicat Premium Data Transfer

 Source Server         : zxl
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : lmodeldb

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 03/01/2025 20:23:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `typeId` int(0) NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `simpleabstract` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(9999) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publishDate` datetime(0) NULL DEFAULT NULL,
  `imagePath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '大规模语言模型与生成模型：技术原理、架构与应用', 1, 'zxl', '大规模语言模型（Large Language Models, LLMs）和生成模型是现代自然语言处理（NLP）领域的核心技术，它们推动了从文本生成到语义理解等广泛应用的技术突破。近年来，随着硬件和数据规模的扩展，诸如GPT、BERT等大规模语言模型展示了超乎寻常的性能，在各类生成任务中表现出色。', '<h3>大规模语言模型概述</h3><p>1.1 什么是大规模语言模型？</p><pre><code class=\"Bash\">大规模语言模型是通过对大量文本数据进行训练的神经网络模型，它能够根据上下文信息生成相关的自然语言输出。其关键特点是：\n\n海量数据训练：LLMs通常使用数十亿到数万亿个单词进行训练，确保模型能够理解广泛的语言表达和上下文。\n深层架构：模型通常有数以百亿级别的参数,这种深度确保了模型在复杂语言任务中的强大泛化能力。\n无监督或自监督学习：这些模型使用大量无标注文本，通过自监督任务（如掩蔽词预测、下一个词预测等）学习语言模式。<br/></code></pre><p>1.2 常见的语言模型架构</p><pre><code class=\"Bash\">GPT（生成预训练模型）：GPT系列模型是典型的自回归模型，它通过生成式任务进行训练，能够根据输入生成自然的语言序列。\nBERT（双向编码器表示）：BERT是自编码器模型，采用双向Transformer架构，通过掩蔽语言模型任务进行训练，擅长文本理解任务。\nT5（文本到文本转换器）：T5是将所有NLP任务都视为文本到文本的转换问题，允许其同时处理生成和理解任务。<br/></code></pre><p>1.3 语言模型的技术突破</p><pre><code class=\"Bash\">   大规模语言模型的技术突破主要体现在以下几个方面：\n\nTransformer架构：自从2017年Vaswani等人提出Transformer以来，它成为了大规模语言模型的标准架构。Transformer通过自注意力机制（Self-Attention）有效捕捉长距离依赖，使得大规模语言模型可以高效训练。\n\n分布式训练：由于模型参数的规模庞大，单台机器无法承载。因此，大规模语言模型的训练通常采用分布式计算框架（如TensorFlow、PyTorch的分布式模式）以及大规模GPU集群。\n\n自监督学习：GPT和BERT等模型的训练采用了自监督学习策略，无需人工标注数据。这使得模型可以在广泛的无标签数据上进行训练。</code></pre><p>2.1 什么是生成模型？</p><p style=\"text-align:center;\">生成模型（Generative Models）是通过学习训练数据的分布来生成新的、类似于训练数据的样本。生成模型的目标不仅仅是分类或回归等传统任务，而是生成具有潜在创意或实用价值的内容，如文本、图像、音频等。<br/>在NLP领域，生成模型通常用于以下任务：<br/>文本生成：如对话生成、文本续写、机器翻译等。<br/>数据增强：通过生成新样本来扩展数据集，提升模型在少样本任务中的表现。<br/>自动总结与摘要：为长文档生成简短的摘要，提取其核心信息。</p><p style=\"text-align:center;\">2.2 自回归模型<br/></p><p>自回归模型（Autoregressive Models）生成每一个单词或字符时，依赖于之前生成的单词或字符。典型的自回归模型包括GPT系列。<br/></p><pre><code class=\"Bash\">from transformers import GPT2Tokenizer, GPT2LMHeadModel\nimport torch\n\n# 加载GPT2模型和tokenizer\ntokenizer = GPT2Tokenizer.from_pretrained(\'gpt2\')\nmodel = GPT2LMHeadModel.from_pretrained(\'gpt2\')\n\n# 输入文本\ninput_text = \"The future of AI is\"\ninput_ids = tokenizer.encode(input_text, return_tensors=\'pt\')\n\n# 生成文本\noutputs = model.generate(input_ids, max_length=50, num_return_sequences=1)\n\n# 打印生成的文本\ngenerated_text = tokenizer.decode(outputs[0], skip_special_tokens=True)\nprint(f\"Generated Text: {generated_text}\")<br/></code></pre><p>3 结论<br/></p><p>大规模语言模型和生成模型已经成为自然语言处理领域的核心技术。本文深入探讨了其技术原理、经典架构、应用场景以及相关的挑战，并通过代码示例展示了如何实现这些模型。未来，随着技术的进一步发展，这些模型将在更多领域中展现出巨大的潜力。<br/>源需求，将成为一个关键研究方向。<br/>2. 跨模态生成：未来的生成模型将不仅仅限于文本或图像，跨模态的生成（如同时生成图像和文字）将是一个重要的研究方向。<br/>3. 多语言与多任务学习：大规模语言模型将进一步扩展到多语言和多任务场景中，提升其在跨语言和跨领域的适应能力。<br/></p><img src=\"http://localhost:8089/zhouxuelian8/upload/e8ee70a3-3d3c-4c28-a427-0d236571e9cd1.png\" style=\"max-width:100%;\" contenteditable=\"false\"/>', '2024-12-19 08:00:00', 'http://localhost:8089/zhouxuelian8/upload/4d03068a-f649-47f3-83bb-b86ac48c70121.png', 1);
INSERT INTO `article` VALUES (2, '50个JAVA常见代码大全：学完这篇就从Java小白到架构师', 1, 'yn', 'Java作为一门流行多年的编程语言，始终占据着软件开发领域的重要位置。无论是初学者还是经验丰富的程序员，掌握Java中常见的代码和概念都是至关重要的。本文将列出50个Java常用代码示例，并提供相应解释，助力你从Java小白成长为架构师。', '<h3>基础语法</h3><h4 style=\"text-align:center;\">1. Hello World</h4><blockquote><p data-we-empty-p=\"\" style=\"text-align:center;\">public class HelloWorld {<br/>    public static void main(String[] args) {<br/>        System.out.println(\"Hello, World!\");<br/>    }<br/>}<br/></p></blockquote><h4>2. 数据类型</h4><blockquote><p>int a = 100;<br/>float b = 5.25f;<br/>double c = 5.25;<br/>boolean d = true;<br/>char e = \'A\';<br/>String f = \"Hello\";<br/></p></blockquote><h4>3. 条件判断</h4><blockquote><p>if (a &gt; b) {<br/>    // 条件成立时执行<br/>} else if (a == b) {<br/>    // 另一个条件<br/>} else {<br/>    // 条件都不成立时执行<br/>}<br/></p></blockquote><h4>4. 循环结构</h4><div><h5>for循环</h5></div><blockquote><p>for (int i = 0; i &lt; 10; i++) {<br/>    System.out.println(\"i: \" + i);<br/>}<br/></p></blockquote><blockquote><h5>while循环</h5><p>int i = 0;<br/>while (i &lt; 10) {<br/>    System.out.println(\"i: \" + i);<br/>    i++;<br/>}<br/></p></blockquote><p>....</p><p>以上就是Java常见的50个代码示例，涵盖了从基础到高级的多方面知识。掌握这些代码片段将极大提升你的编码技能，并为成长为一名优秀的Java架构师打下坚实基础。持续实践和学习，相信不久的将来，你将在Java的世界里驾轻就熟。</p>', '2024-01-02 08:00:00', 'http://localhost:8089/zhouxuelian8/upload/86dc3aec-87de-474d-a130-1cbdb6f150f81.png', 2);
INSERT INTO `article` VALUES (3, 'C/C++编程笔记：指针篇！从内存理解指针，让你完全搞懂指针', 2, 'lql', '本文详细介绍了C/C++中的指针，包括指针的本质、内存模型、多级指针、数组与指针的关系，以及void指针的用途。通过深入理解指针与内存的关系，帮助读者掌握指针的高级用法，提升编程技能', '<p>C语言最核心的知识就是指针，所以，这一篇的文章主题是「指针与内存模型」！说到指针，就不可能脱离开内存，学会指针的人分为两种，一种是不了解内存模型，另外一种则是了解。<br/><br/>不了解的对指针的理解就停留在“指针就是变量的地址”这句话，会比较害怕使用指针，特别是各种高级操作。而了解内存模型的则可以把指针用得炉火纯青，各种 byte 随意操作，让人直呼 666。<br/><img src=\"http://localhost:8089/zhouxuelian8/upload/66a07500-70fe-42db-8dd7-a36e5a24544fimage.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>一、内存本质<br/>编程的本质其实就是操控数据，数据存放在内存中。<br/>因此，如果能更好地理解内存的模型，以及 C 如何管理内存，就能对程序的工作原理洞若观火，从而使编程能力更上一层楼。<br/></p><p><strong>1.1 内存编址</strong></p><p>计算机的内存是一块用于存储数据的空间，由一系列连续的存储单元组成，就像下面这样，</p><p><img src=\"http://localhost:8089/zhouxuelian8/upload/eda6a7c9-85e9-4a10-bff3-18546c506cb0image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>每一个单元格都表示 1 个 Bit，一个 bit 在 EE 专业的同学看来就是高低电位，而在 CS 同学看来就是 0、1 两种状态。由于 1 个 bit 只能表示两个状态，所以大佬们规定 8个 bit 为一组，命名为 byte。并且将 byte 作为内存寻址的最小单元，也就是给每个 byte 一个编号，这个编号就叫内存的地址 。<br/><img src=\"http://localhost:8089/zhouxuelian8/upload/8347f2a7-d8ce-4620-8791-ded5e856c0c3image.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p>这就相当于，我们给小区里的每个单元、每个住户都分配一个门牌号： 301、302、403、404、501......<br/>在生活中，我们需要保证门牌号唯一，这样就能通过门牌号很精准的定位到一家人。<br/>同样，在计算机中，我们也要保证给每一个 byte 的编号都是唯一的，这样才能够保证每个编号都能访问到唯一确定的 byte。<br/></p><p><strong>2.2 指针本质</strong></p><p>编译器会自动维护一个映射，将我们程序中的变量名转换为变量所对应的地址，然后再对这个地址去进行读写。也就是有这样一个映射表存在，将变量名自动转化为地址：</p><p><img src=\"http://localhost:8089/zhouxuelian8/upload/50424ae9-1069-4335-8eb1-2e54027a7138image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><p><img src=\"http://localhost:8089/zhouxuelian8/upload/2bae5fe7-f4a3-41f5-85f9-0993cd9f2703image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/><br/>七、花式秀技<br/>很多同学认为 C 就只能面向过程编程，实际上利用指针，我们一样可以在 C 中模拟出对象、继承、多态等东西。<br/>也可以利用 void 指针实现泛型编程，也就是 Java、C++ 中的模板。<br/>大家如果对 C 实现面向对象、模板、继承这些感兴趣的话，可以积极一点，点赞，留言~<br/></p>', '2024-01-01 08:00:00', 'http://localhost:8089/zhouxuelian8/upload/2fe6764a-3155-4da4-92a4-39a42b158e602.jpeg', 3);
INSERT INTO `article` VALUES (4, '2023 AI开发者生态报告：技术生态、开发范式与应用案例全景', 1, 'lxy', '随着人工智能技术的飞速发展，全球IT市场对AI的投入持续增长，预计到2027年将达到4236亿美元。中国作为AI领域的重要参与者，其投资规模预计将占全球的9%。在这样的背景下，2023年的《AI开发者生态报告》为我们揭示了人工智能时代的技术生态、开发范式以及应用案例的全貌。', '<p><h3 id=\"c64lg\">技术生态的历史与发展</h3><br/>报告首先回顾了人工智能技术生态的历史，从1936年图灵的《论可计算数及其在判定问题中的应用》到2022年OpenAI推出基于大语言模型的ChatGPT，AI技术经历了从早期萌芽到快速发展的阶段。特别是近年来，AI软件投入的增长速度位居技术市场第一，规模近百亿，显示出AI技术在各行业的融合落地中的巨大潜力。<br/><br/><img src=\"http://localhost:8089/zhouxuelian8/upload/Ai.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><h3 id=\"3brdm\">开发生态的全景图及应用案例</h3><br/>报告中详细描绘了人工智能时代的开发生态全景图，包括ADAS/自动驾驶、智慧金融、智能制造、智能医疗和智慧教育等多个领域的应用案例。这些案例展示了AI技术如何与不同行业的需求相结合，推动产业升级和创新。<br/><br/><h3 id=\"7k1r9\">开发范式的变迁及趋势</h3><br/>报告指出，人工智能时代的开发范式正在经历重大变迁，人+AI协作编程成为新的开发范式。代码生成工具的使用频率和满意度显著提高，近90%的开发者已经使用这些工具，其中35%的开发者每天使用。此外，开发环境的全面升级，以及模型技术的持续关注，都是当前开发范式变化的重要趋势。<br/><br/><h3 id=\"1drvr\">开发者工程技术栈</h3><br/>报告还介绍了人工智能应用开发的工程技术栈，包括端到端的提示词工程、智能体开发服务，以及模型调用层、模型部署、模型推理等环节。这些工程技术栈的发展，为开发者提供了更加高效和便捷的开发工具和服务。<br/><img src=\"http://localhost:8089/zhouxuelian8/upload/Ai.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '2024-01-02 15:54:17', 'http://localhost:8089/zhouxuelian8/upload/Ai.jpg', 6);
INSERT INTO `article` VALUES (5, 'Python 语法及入门 （超全超详细） 专为Python零基础 一篇博客让你完全掌握Python语法', 3, 'sjx', '本文详细介绍了Python的基础语法，包括变量、字面量、字符串、循环、判断语句、函数的定义与调用，以及数据容器如列表、元组、字符串、集合和字典的使用。特别强调了Python中列表的动态扩展、元组的不可变性、字符串的特性以及字典的键值对操作。此外，还探讨了数据容器的遍历、转换和排序方法。', '<h2>一、什么是Python</h2><h3><a></a>1.1 Python的诞生</h3><p>1989年，为了<strong>打发</strong>圣诞节假期，Gudio van Rossum吉多·&nbsp;范罗苏姆（龟叔）决心开发一个新的解释程序（Python雏形）</p><p>1991年，第一个Python解释器诞生</p><p>Python这个名字，来自龟叔所挚爱的电视剧Monty Python\'s Flying Circus</p><p><img src=\"http://localhost:8089/zhouxuelian8/upload/64635771-e68d-43e1-bebc-3679ca8ec800image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/><img src=\"http://localhost:8089/zhouxuelian8/upload/0844af3c-e30c-4b73-b144-4f2abd8ba2c0image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><h3>1.2 为什么学习Python</h3><p><img src=\"http://localhost:8089/zhouxuelian8/upload/1edde248-0756-451d-8c43-eed107077976image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><h3>1.3Python的应用场景</h3><p><img src=\"http://localhost:8089/zhouxuelian8/upload/3ada8985-c877-4363-b703-b760ded93b70image.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><h2>二、Python的基础语法</h2><h3>2.1字面量</h3><p><img src=\"http://localhost:8089/zhouxuelian8/upload/cbf4e6d3-5a3f-4a7e-bf9a-86a5c9d213ccimage.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><h4>2.2.2 Python 语句格式与C的区别</h4><blockquote><p>首先，python语句不需要以分号结尾，而是以每一行作为区分，有点像每一行末尾处都加了分号（当然，实际不是，也不相同）</p></blockquote><blockquote><p>代码缩进：在C中，代码的缩进只影响代码的可读性和美观，不影响实际使用</p><p>而在python中，代码缩进控制着不同函数相互间的嵌套和归属</p><p><font color=\"#c24f4a\"><strong>Python</strong><strong>通过缩进判断代码块的归属关系。</strong></font></p></blockquote><blockquote><p>大括号格式：Kernighan和Ritchie格式 (Kb&amp;R格式)&nbsp;</p><p>当大括号内需要有多行语句，左侧的大括号与语句同行，不再另一分行</p></blockquote><p>2.3 类型转换注意事项</p><p>类型转换不是万能的，毕竟强扭的瓜不甜，我们需要注意：</p><blockquote><p><font color=\"#f9963b\">1.&nbsp;任何类型，都可以通过str()，转换成字符串</font></p><p><font color=\"#f9963b\">2.&nbsp;字符串内必须真的是数字，才可以将字符串转换为数字</font></p></blockquote><h2>结尾留言</h2><p>尊敬的读者，您好！</p><p>当你将这篇文章看完并加以实践后，Python的语法到这里也告了一段落</p><p>后续博主会不定时对这篇文章加以补充并往后续写Python新的内容</p>', '2024-01-06 08:00:00', 'http://localhost:8089/zhouxuelian8/upload/f059612d-29bd-4147-a7ce-b07175fe0c493.png', 5);
INSERT INTO `article` VALUES (6, '大语言模型推理的价格战，靠规模取胜？', 1, 'zxl', '目前除了 OpenAI，还有五家公司的模型在多个基准测试中超越了 GPT-3.5，这些公司包括 Mistral Mixtral、Inflection-2、Anthropic Claude 2、Google Gemini Pro 和 X.AI Grok。更令人惊讶的是，Mistral 和 X.AI 仅靠不到 20 人的团队便取得了这样的成就。此外，我们还预计 Meta、Databricks、01.AI (Yi)、百度和字节跳动很快也会实现超过 GPT-3.5 的性能。当然，这些成绩都是在基准测试中获得的，而且据说有些公司是在评估数据上进行训练的……但不', '<p><img src=\"http://localhost:8089/zhouxuelian8/upload/OpenAi.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/></p><h4><strong id=\"bjtz8\">Mixtral 在 H100, MI300X, H200, A100 上的混合推理成本，及推测性解码</strong></h4><p>那些通过完整的软件即服务或社交媒体直接接触客户，从而拥有独特分销渠道的公司将具有优势。那些为他人提供全方位训练或微调服务，帮助他们处理从数据到服务的每个阶段的公司，将具有优势。能够提供数据保护并确保所有模型使用合法的公司，也将具有优势。而那些仅仅提供开放模型服务的公司则不会有竞争优势。<br/>一些显著的优势可以从 Microsoft 的 Azure GPT API 与 OpenAI 的对比中看出。在公共和私有实例的推理量方面，Microsoft 的表现超过了 OpenAI 自身的 API。对于谨慎的企业来说，Microsoft 提供的安全性、数据保障以及服务合同捆绑是非常重要的。此外，这些保护措施还使得滥用行为者更容易逃避责任，正如 ByteDance 使用 Azure GPT-4 来训练他们即将推出的大语言模型 (LLMs) 所示。</p><div><img src=\"http://localhost:8089/zhouxuelian8/upload/OpenAi.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></div><p><h4 id=\"q6acz\">量化技术</h4><p>量化技术的应用能显著提升模型运行的速度和成本效率。但如果处理不当，量化可能会严重降低模型质量。一般来说，对模型进行量化处理后，需要进行精细的微调 (fine-tune)。然而，目前市场上一些低成本的供应商并未进行这一必要的微调步骤，他们往往半途而废地进行量化，忽视了模型的准确性。这些低价供应商的模型，与 16 位 Mixtral 模型相比，生成的输出质量远不如后者。</p><img src=\"http://localhost:8089/zhouxuelian8/upload/OpenAi.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><img src=\"http://localhost:8089/zhouxuelian8/upload/OpenAi.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><h4 id=\"720lc\">H200 &amp; MI300X 性能分析</h4>即将推出的 H200 和 MI300X 将带来变革。它们分别配备了 141GB 和 196GB 的内存，以及比 H100 和 A100 更高的内存带宽。在我们的模型中，与市面上的 A100 和 H100 相比，H200 和 MI300X 的每 Token 成本更具优势。我们发现，摒弃张量并行性（目前 Nvidia 的 NCCL 实现在全归约方面表现很差）将带来巨大的好处。<br/>接下来，我们将展示这些系统在成本效益方面的性能。请注意，这些系统目前仍处于初步部署阶段。我们预计，就像一些主要提供商使用基于 H100 系统的高度优化的自定义推理堆栈一样。目前，Nvidia 的闭源 TensorRT-LLM 和 AMD 的相对开放的 vLLM 集成策略并未直接提供此类优化，但我们预期这会随着时间的推移而改变。<br/><br/></p>', '2024-12-20 16:23:44', 'http://localhost:8089/zhouxuelian8/upload/OpenAi.jpg', 1);
INSERT INTO `article` VALUES (7, 'LLM大语言模型：在ChatGLM3-6B中使用langchain', 3, 'yn', 'LangChain是一个用于开发由语言模型驱动的应用程序的框架。它使应用程序能具有上下文意识，将语言模型与上下文源联系起来。相信大家都很熟悉LangChain里很流行的两个概念Chain和Agent，本文将介绍在ChatGLM3-6B里是如何使用LangChain的。', '<h4><b id=\"fc75c\">准备工作</b>😍</h4>进入如下目录： cd langchain_demo<br/><br/>修改模型文件的路径：在 main.py 文件中，修改 model_path = ￥你本地的模型文件路径￥ 路径，也可以填写 THUDM/chatglm3-6b 自动下载模型（推荐使用本地模型，如果你能使用魔法当我没说）。<br/>模型下载参考：LLM大语言模型（一）：ChatGLM3-6B本地部署<br/><br/>安装依赖：推荐使用conda环境， pip install -r .requirements.txt<br/><br/><h4 id=\"34yfw\"><b>工具添加<br/></b><b>LangChain 已实现工具</b></h4>参考 langchain 工具相关函数，在 main.py 中导入工具模块，例如导入 arxiv 工具<br/><pre><code class=\"Python\">run_tool([\"arxiv\"], llm, [\n    \"帮我查询AgentTuning相关工作\"\n])\n</code></pre><h4><b>Calculator、Weather Tool配置</b></h4>如果你的 Python 环境中 LangChain 的版本低于 0.0.278 则需要在这两个预定义工具类中实现 _arun 方法<br/>否则将会出现<br/>TypeError: Can\'t instantiate abstract class Weather with abstract method _arun<br/><br/>示例如下：<br/><pre><code class=\"Python\">class Weather(BaseTool):\n    name = \"weather\"\n    description = \"Use for searching weather at a specific location\"\n\n    async def _arun(self, *args: Any, **kwargs: Any) -&gt; Any:\n        # 用例中没有用到 arun 不予具体实现\n        pass\n</code></pre><p>运行&nbsp;<code><u><font color=\"#f9963b\">main.py</font></u></code>&nbsp;文件<br/></p><p>模型会因找不到 arxiv 工具的 yaml 文件描述而中断，需要用户手动构建 ./Tool/arxiv.yaml 文件。用户可自行添加工具描述，也可以参考 LangChain 对该工具的描述。<br/><br/>对 arxiv 这个例子而言，参考内容位于 ./Tool/arxiv_example.yaml 文件，可参考该文件构建 Tool/arxiv.yaml 文件（最简单的方式修改名称即可），重新运行模型就能合理调用工具。<br/><br/><span style=\"background-color: rgb(139, 170, 74);\">有些工具需要导入 API_KEY，按照 langchain 报错添加到环境变量即可。</span></p><h4 id=\"ii8d9\">自定义工具</h4><p>如果用户想自定义工具，可以参考&nbsp;<code>Tool/Weather.py</code>&nbsp;以及&nbsp;<code>Tool/Weather.yaml</code>&nbsp;文件，重载新的&nbsp;<code>Tool</code>&nbsp;类，实现其对应的&nbsp;<code>_run()</code>&nbsp;方法，然后在&nbsp;<code>main.py</code>&nbsp;中导入该工具模块，例如导入&nbsp;<code>Weather</code>&nbsp;工具，即可以调用</p><pre><code class=\"Python\"># 对同一个工具调用多次\n# 需要 export SENIVERSE_KEY=&lt;YOUR_API_KEY_HERE&gt;\nrun_tool([Weather()], llm, [\n        \"今天北京天气怎么样？\",\n        \"What\'s the weather like in Shanghai today\",\n])\n</code></pre><p data-we-empty-p=\"\" style=\"padding-left:2em;\"><img src=\"http://localhost:8089/zhouxuelian8/upload/LainChain.png\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', '2024-12-20 08:00:00', 'http://localhost:8089/zhouxuelian8/upload/LainChain.png', 2);
INSERT INTO `article` VALUES (8, '多模态大语言模型', 3, 'sjx', '多模态大语言模型（Multimodal Large Language Model, MLLM）主要是指那些能够处理和整合多种模态信息（比如文本、图像和音频）的大语言模型。本节内容将以视觉-语言大语言模型为例，对相关技术进行介绍，类似的技术也可扩展到其他模态（如音频-语言）。', '<h1><b id=\"ip6bq\">多模态大语言模型</b></h1><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;多模态大语言模型的模型结构和训练数据如下图所示。通常来说，多模态大语言模型主要由一个用于图像编码的视觉编码器和一个用于文本生成的大语言模型所组成，进一步这两个模型通过连接模块进行组合，从而将视觉的表示对齐到文本语义空间中。在文本生成的过程中，图像首先被分割成图像块（Patch），然后通过图像编码器和连接模块转换成图像块嵌入，以得到大语言模型可以理解的视觉表示。随后，图像块嵌入和文本嵌入进行拼接并输入到大语言模型中，使大语言模型可以自回归地生成文本回复。下面将讨论多模态大语言模型的训练、评测、代表性模型，以及应用建议与未来方向。</p><p><img src=\"http://localhost:8089/zhouxuelian8/upload/00299f98-8aa2-4223-b8ba-d488e9b2150fimage.png\" contenteditable=\"false\" style=\"font-size: 14px; max-width: 100%;\"/></p><p data-we-empty-p=\"\" style=\"text-align:center;\">训练过程<br/>多模态大语言模型的训练过程主要包括两个阶段：视觉-语言对齐预训练和视觉指令微调。<br/>视觉-语言对齐预训练<br/>为了训练多模态大语言模型，一般重用已有的视觉编码器和大语言模型。由于视觉模型和语言模型之间存在较大的语义空间差异，因此视觉-语言对齐预训练旨在利用大规模“图像-文本对”（简称图文对）进行端到端训练，进而对齐两种不同的语义空间。为了提高对齐性能，选择合适的训练策略和数据非常重要。下面给出一些经验性的训练策略：<br/>（1）如果图文对数量不足够大（例如少于 1M），通常只更新连接模块；<br/>（2）如果训练数据规模相对较大，且包括高质量文本语料或具有细粒度标注的图像-文本对，可以微调大语言模型以提升性能；<br/>（3）如果图文对的数量非常大（例如 1B 规模），可以进一步微调视觉编码器。以上方案均来源于经验性的实验，在使用中仍需进一步验证确定。<br/><br/>视觉指令微调<br/>在视觉-语言对齐预训练之后，下一阶段需要进行视觉指令微调，旨在提高多模态大语言模型遵循指令和解决任务的能力。一般来说，视觉指令微调的输入包括一张图像和一段任务描述文本，输出是对应的文本回复。为了构造高质量的视觉指令数据，可以将图像自带的描述文本输入给大语言模型（如GPT-4），通过特定的提示（如“根据图像描述生成一段图像相关的对话”）来引导大语言模型自动化地合成视觉指令；或者基于已有的视觉-语言任务数据集，利用特定的问题模板将原有任务数据转化为视觉指令（如“请参考图片回答以下问题并给出详细解释”。</p><p data-we-empty-p=\"\" style=\"text-align:center;\"><br/>多模态大语言模型的评测<br/>在介绍完多模态大语言模型的构建方法后，下面进一步讨论如何评测多模态大语言模型的多模态能力，将从评测维度、评测范式和评测基准三个方面进行介绍。<br/><br/>评测维度<br/>多模态大语言模型的评测任务主要可以被划分为两类：视觉感知和视觉认知任务。具体来说，视觉感知任务旨在评测模型对于图像内容的基本理解能力，而视觉认知任务要求模型根据图像内容完成相对复杂的推理任务。视觉感知任务常用的评测数据集主要关注于对图像整体特征（如主题、风格等）或图中物体特征（如颜色、数量、位置关系等）的识别和分类。特别地，模型对于图片的感知结果与图片实际内容可能存在差异，这种现象被称为幻象问题，可以进行专门的幻象评测（如使用物品幻象评测基准 POPE）。视觉认知任务主要关注于利用语言模型中的语义知识和图像中的视觉感知信息，进而完成更复杂的视觉相关推理任务。其中，视觉问答（Visual Question Answering, VQA）是被广泛用于评测的认知任务，其通过构造和图片内容相关的推理问题来测试模型性能。问题涉及的内容可以是给出的图片中物体之间的空间位置关系（如“图中的碗是在绿色苹果的右侧吗？”）、常识知识（如“图中的人物应该通过哪种动作才能打开这扇门，推还是拉？”）或场景文字（如“图中车辆的车牌号是多少？”）等。<br/><br/>评测基准<br/>为了更全面地评测多模态大语言模型，学术界发布了多个综合评测基准。这些评测基准整合了已有的多模态数据集，并且增加了借助人类或大语言模型进行标注的评测任务。其中，三个常用的评测基准包括：<br/>（1）MME主要包括了从公开途径获得的图片配上手工收集的自然语言问题，这些问题的答案形式被限定为是或否，用于评测多模态大模型在 14 个视觉感知和认知任务上的表现；<br/>（2）MMBench 基于现有数据集，手工构造了 2,974 条用于评测多模态能力的多项选择题，总共涵盖了 20 类不同的多模态任务；<br/>（3）MM-Vet 首先定义了 6 项基础的多模态能力，之后将这些能力组合为 16 种不同的复杂多模态任务，之后收集了 200 张图片和 218 个文本问题用于评测。<br/>代表性的多模态大语言模型<br/>近年来，学术界和工业界涌现出了多种多模态大语言模型。下面介绍一些具有代表性的多模态大语言模型。<br/><br/>MiniGPT-4<br/>MiniGPT-4 是较为早期的开源多模态大语言模型，主要包括三个组件：CLIP 和 Q-Former 组成的视觉编码器，对齐视觉和语言特征表示的线性层，以及大语言模型 Vicuna。MiniGPT-4 的训练经历两个阶段：首先是视觉-语言对齐的预训练阶段，此阶段主要使用了来自 LAION, SBU 和 Conceptual Captions的大量图文对数据集，针对模型的线性层进行训练，旨在为模型建立初步的跨模态理解能力。进一步，在视觉指令微调阶段，作者收集了 3,500 条高质量的详细图片描述，并将其组织成对话形式进行模型微调，以提高模型的语言流畅度和对话交互能力。这一阶段也仅针对线性层进行训练。<br/><br/>LLaVA<br/>LLaVA 也是早期的开源多模态大语言模型之一，其模型结构与 MiniGPT-4 类似，但视觉编码器部分仅由 CLIP 组成。LLaVA 在视觉-语言对齐预训练阶段，从 CC3M 中收集了 595K 图文对数据来训练线性层；在视觉指令微调阶段利用 ChatGPT 改写了 COCO 数据集中的图文对，创建了 158K 条复杂视觉指令数据，涵盖了图像描述、看图对话和视觉推理等类型的任务，然后使用这些数据同时训练大语言模型和线性层。LLaVA 后续还推出了 LLaVA-1.5 和 LLaVA-Plus等加强版本。其中，LLaVA-1.5 增加了视觉-语言表示对齐的线性层的参数，并在训练数据中加入了更多任务相关数据（如知识问答和场景文字识别）以进一步提升模型能力。<br/><br/>GPT-4V<br/>OpenAI 在 2023 年 3 月的技术报告中首次介绍了 GPT-4V 的多模态能力，针对照片、截图、图表等多种图片形式，GPT-4V 均能有效回答与其相关的自然语言问题。2023 年 9 月，OpenAI 正式发布了 GPT-4V 的系统概述，重点介绍了其在安全性对齐方面的进展，能够有效避免有害内容的输出。2023年11月6日，OpenAI 向公众开放了 GPT-4V 的 API 接口。已有评测工作表明，GPT-4V 不仅在文本任务上领先此前的模型，在传统 VQA 任务（例如 OK-VQA）以及针对多模态大模型的复杂评测基准（如 MMMU）上的表现也都处于领先水平。<br/><br/>Gemini<br/>2023 年12月14日，谷歌推出了 Gemini 系列大模型，其中发布了多模态模型 Gemini Pro Vision 的 API。技术报告中提到，Gemini 采用的是纯解码器架构，能够处理文本、音频和视觉模态的输入，并能生成文本或图像的输出。它的训练数据涵盖了从网页、书籍、代码到图像、音频和视频等多样的数据来源。在各种评测基准上的测试结果表明，Gemini 不仅在文本生成和理解方面表现出色，还能够完成视频理解、音频识别等其他模态任务。<br/><br/>总结<br/>基于以上讨论，我们对多模态大语言模型给出了以下应用建议和未来方向。<br/><br/>应用建议<br/>现有的评测结果表明，闭源模型（如 GPT-4V、Gemini 等）的通用多模态数据处理能力普遍优于开源的多模态大语言模型。然而，闭源模型不利于进行端到端或者增量式的应用开发。因此，对于特定的多模态任务场景，如果能够针对性地构造高质量多模态指令数据并对开源模型进行训练，也是一个重要的技术路线。此外，由于真实应用场景较为复杂，直接利用多模态大语言模型可能并不能有效应对所有复杂案例，还可以考虑让多模态大模型学习使用其他工具（如图像分割模型等），从而加强多模态模型的任务效果。<br/><br/>未来方向<br/>尽管目前的多模态大语言模型已经初步具备了基于视觉信息进行推理的能力，但是其在复杂多模态应用场景下的效果仍然非常受限，如基于多图的复杂逻辑推理问题、细粒度的语义理解问题等。为了加强多模态模型的复杂推理能力，可以构造覆盖场景更广且更加复杂的视觉指令集合以强化模型本身的视觉推理能力，而更为本质的问题是去思考多模态大模型的建立方法与学习机制。例如，Gemini 从头对于多模态数据进行混合预训练，而不是将多模态组件直接向大语言模型进行对齐。此外，多模态大语言模型可能输出虚假或有害的信息（如物体幻象），这会对于模型的安全性造成很大影响。针对这一问题，既需要在模型<br/>层面分析幻象的导致原因（如图片侧防御能力较弱等），也可以通过收集类似红队攻击或幻象识别的视觉指令，用来微调多模态大语言模型以增强其健壮性。<br/>————————————————<br/><br/>                            版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。<br/>                        <br/>原文链接：<a href=\"https://blog.csdn.net/weixin_43915730/article/details/138157663\" target=\"_blank\">https://blog.csdn.net/weixin_43915730/article/details/138157663</a><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>Cuda 和 GPU版torch安装最全攻略，以及在GPU 上运行 torch代码<br/>查看可用 torch 版本<br/>下载CUDA<br/>安装cudnn<br/>下载cudatoolkit<br/>下载 GPU版本的pyTorch<br/>先查看当前有哪些Torch 版本<br/>下载torch 和torchvision的 whl 文件<br/>pip install 安装并检查<br/>import torch 并检查是否可用的 cuda版本<br/>在GPU运行 torch 代码<br/>GPU torch 常用指令<br/>指定 device 为 CPU 或 GPU<br/>查看GPU是否可用及设备名称<br/>在GPU上建立Tensor<br/>查看内存大小和显存信息<br/>如果GPU设备可用，将默认热备改为GPU<br/>总结<br/>参考<br/>查看可用 torch 版本<br/>在 conda prompt 中 检查是否有可用的GPU版本 torch.cuda，发现False</p><p><img src=\"http://localhost:8089/zhouxuelian8/upload/Cudatorch.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/>下载CUDA<br/>命令行输入nvidia-smi，查看 cuda 信息：<br/><br/>从官网下载对应版本的安装程序 CUDA Toolkit Archive | NVIDIA Developer<br/><br/><br/></p>', '2024-12-10 08:00:00', 'http://localhost:8089/zhouxuelian8/upload/Cudatorch.jpg', 5);

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userId` int(0) NULL DEFAULT NULL,
  `articleId` int(0) NULL DEFAULT NULL,
  `createAt` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, 2, 4, '2024-12-04 13:31:53');
INSERT INTO `favorite` VALUES (2, 3, 5, '2024-12-20 13:31:59');
INSERT INTO `favorite` VALUES (3, 4, 3, '2024-12-24 13:32:03');
INSERT INTO `favorite` VALUES (4, 5, 1, '2024-12-10 13:32:05');
INSERT INTO `favorite` VALUES (5, 6, 1, '2024-12-13 13:32:08');
INSERT INTO `favorite` VALUES (6, 1, 2, '2025-01-03 01:19:43');
INSERT INTO `favorite` VALUES (7, 1, 6, '2025-01-03 01:19:49');
INSERT INTO `favorite` VALUES (8, 1, 5, '2025-01-03 01:20:34');
INSERT INTO `favorite` VALUES (9, 1, 7, '2025-01-03 01:20:57');
INSERT INTO `favorite` VALUES (10, 1, 1, '2025-01-03 01:22:13');
INSERT INTO `favorite` VALUES (11, 5, 3, '2025-01-03 01:28:50');

-- ----------------------------
-- Table structure for logrecord
-- ----------------------------
DROP TABLE IF EXISTS `logrecord`;
CREATE TABLE `logrecord`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `operateName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `operateMethodName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `operateTime` datetime(0) NULL DEFAULT NULL,
  `executionTime` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 535 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logrecord
-- ----------------------------
INSERT INTO `logrecord` VALUES (1, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-28 15:31:19', 1);
INSERT INTO `logrecord` VALUES (2, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-28 15:31:21', 1);
INSERT INTO `logrecord` VALUES (3, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-28 16:02:37', 2);
INSERT INTO `logrecord` VALUES (4, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-28 16:02:38', 2);
INSERT INTO `logrecord` VALUES (5, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-28 16:05:29', 1);
INSERT INTO `logrecord` VALUES (6, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:05:34', 1);
INSERT INTO `logrecord` VALUES (7, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-28 16:05:36', 2);
INSERT INTO `logrecord` VALUES (10, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-28 16:06:08', 2);
INSERT INTO `logrecord` VALUES (11, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:06:10', 4);
INSERT INTO `logrecord` VALUES (12, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-28 16:06:12', 2);
INSERT INTO `logrecord` VALUES (13, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:08:50', 2);
INSERT INTO `logrecord` VALUES (15, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:09:23', 1);
INSERT INTO `logrecord` VALUES (16, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:09:30', 1);
INSERT INTO `logrecord` VALUES (17, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:09:46', 1);
INSERT INTO `logrecord` VALUES (18, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:09:49', 0);
INSERT INTO `logrecord` VALUES (20, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-28 16:12:55', 1);
INSERT INTO `logrecord` VALUES (21, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'commentArticle', '2024-12-28 16:13:30', 1);
INSERT INTO `logrecord` VALUES (22, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-28 16:13:48', 1);
INSERT INTO `logrecord` VALUES (23, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-28 16:13:49', 1);
INSERT INTO `logrecord` VALUES (24, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-28 16:13:49', 1);
INSERT INTO `logrecord` VALUES (25, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-28 16:13:50', 2);
INSERT INTO `logrecord` VALUES (26, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-28 16:13:50', 2);
INSERT INTO `logrecord` VALUES (27, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-28 16:13:50', 0);
INSERT INTO `logrecord` VALUES (28, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:19:52', 0);
INSERT INTO `logrecord` VALUES (29, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-28 16:20:09', 1);
INSERT INTO `logrecord` VALUES (30, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 21:28:38', 4);
INSERT INTO `logrecord` VALUES (31, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 21:28:44', 3);
INSERT INTO `logrecord` VALUES (32, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 21:28:49', 2);
INSERT INTO `logrecord` VALUES (33, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 21:28:51', 3);
INSERT INTO `logrecord` VALUES (34, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:28:52', 2);
INSERT INTO `logrecord` VALUES (35, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-29 21:28:55', 0);
INSERT INTO `logrecord` VALUES (36, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-29 21:28:57', 1);
INSERT INTO `logrecord` VALUES (37, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 21:29:05', 4);
INSERT INTO `logrecord` VALUES (38, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:29:14', 2);
INSERT INTO `logrecord` VALUES (39, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 21:40:07', 2);
INSERT INTO `logrecord` VALUES (40, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-29 21:40:21', 0);
INSERT INTO `logrecord` VALUES (41, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-29 21:45:49', 1);
INSERT INTO `logrecord` VALUES (42, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'likeArticle', '2024-12-29 21:45:51', 1);
INSERT INTO `logrecord` VALUES (43, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:45:55', 1);
INSERT INTO `logrecord` VALUES (44, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:47:12', 1);
INSERT INTO `logrecord` VALUES (45, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:48:21', 3);
INSERT INTO `logrecord` VALUES (46, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:54:07', 1);
INSERT INTO `logrecord` VALUES (47, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:55:51', 2);
INSERT INTO `logrecord` VALUES (48, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:57:12', 1);
INSERT INTO `logrecord` VALUES (49, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:57:24', 2);
INSERT INTO `logrecord` VALUES (50, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 21:59:13', 2);
INSERT INTO `logrecord` VALUES (51, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 21:59:15', 1);
INSERT INTO `logrecord` VALUES (52, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 21:59:24', 1);
INSERT INTO `logrecord` VALUES (53, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:00:51', 3);
INSERT INTO `logrecord` VALUES (54, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:00:52', 1);
INSERT INTO `logrecord` VALUES (55, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:00:53', 2);
INSERT INTO `logrecord` VALUES (56, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:01:00', 1);
INSERT INTO `logrecord` VALUES (57, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 22:01:02', 2);
INSERT INTO `logrecord` VALUES (58, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:12:15', 12);
INSERT INTO `logrecord` VALUES (59, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:12:17', 2);
INSERT INTO `logrecord` VALUES (60, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 22:12:19', 2);
INSERT INTO `logrecord` VALUES (61, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:12:22', 1);
INSERT INTO `logrecord` VALUES (62, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:12:24', 2);
INSERT INTO `logrecord` VALUES (63, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:12:27', 0);
INSERT INTO `logrecord` VALUES (64, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 22:12:28', 1);
INSERT INTO `logrecord` VALUES (65, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'updateArticle', '2024-12-29 22:13:09', 2);
INSERT INTO `logrecord` VALUES (66, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-29 22:13:09', 1);
INSERT INTO `logrecord` VALUES (67, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:09', 2);
INSERT INTO `logrecord` VALUES (68, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:15', 2);
INSERT INTO `logrecord` VALUES (69, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:16', 1);
INSERT INTO `logrecord` VALUES (70, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:29', 1);
INSERT INTO `logrecord` VALUES (71, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:32', 1);
INSERT INTO `logrecord` VALUES (72, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:33', 1);
INSERT INTO `logrecord` VALUES (73, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:34', 1);
INSERT INTO `logrecord` VALUES (74, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:44', 1);
INSERT INTO `logrecord` VALUES (75, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:49', 1);
INSERT INTO `logrecord` VALUES (76, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:53', 1);
INSERT INTO `logrecord` VALUES (77, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:13:57', 0);
INSERT INTO `logrecord` VALUES (78, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:14:00', 1);
INSERT INTO `logrecord` VALUES (79, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:14:03', 0);
INSERT INTO `logrecord` VALUES (80, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:14:05', 1);
INSERT INTO `logrecord` VALUES (81, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:14:08', 1);
INSERT INTO `logrecord` VALUES (82, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:24:02', 3);
INSERT INTO `logrecord` VALUES (83, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:24:54', 3);
INSERT INTO `logrecord` VALUES (84, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:25:18', 1);
INSERT INTO `logrecord` VALUES (85, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:25:27', 1);
INSERT INTO `logrecord` VALUES (86, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:25:55', 1);
INSERT INTO `logrecord` VALUES (87, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-29 22:26:02', 1);
INSERT INTO `logrecord` VALUES (88, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:26:04', 1);
INSERT INTO `logrecord` VALUES (89, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:26:05', 1);
INSERT INTO `logrecord` VALUES (90, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 22:26:09', 0);
INSERT INTO `logrecord` VALUES (91, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-29 23:27:53', 2);
INSERT INTO `logrecord` VALUES (92, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-30 20:25:20', 3);
INSERT INTO `logrecord` VALUES (93, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-30 20:38:59', 2);
INSERT INTO `logrecord` VALUES (94, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-30 22:00:11', 1);
INSERT INTO `logrecord` VALUES (95, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-30 22:01:24', 1);
INSERT INTO `logrecord` VALUES (96, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-30 22:56:41', 2);
INSERT INTO `logrecord` VALUES (97, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 00:29:12', 7);
INSERT INTO `logrecord` VALUES (98, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 00:29:54', 2);
INSERT INTO `logrecord` VALUES (99, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 00:35:47', 2);
INSERT INTO `logrecord` VALUES (100, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-31 01:30:50', 4);
INSERT INTO `logrecord` VALUES (101, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:30:23', 3);
INSERT INTO `logrecord` VALUES (102, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-31 15:32:47', 2);
INSERT INTO `logrecord` VALUES (103, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:32:59', 1);
INSERT INTO `logrecord` VALUES (104, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:33:37', 2);
INSERT INTO `logrecord` VALUES (105, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-31 15:33:57', 1);
INSERT INTO `logrecord` VALUES (106, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:34:02', 1);
INSERT INTO `logrecord` VALUES (107, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-31 15:34:04', 1);
INSERT INTO `logrecord` VALUES (108, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:34:06', 1);
INSERT INTO `logrecord` VALUES (109, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:34:08', 2);
INSERT INTO `logrecord` VALUES (110, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:34:09', 2);
INSERT INTO `logrecord` VALUES (111, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:34:12', 2);
INSERT INTO `logrecord` VALUES (112, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:34:15', 1);
INSERT INTO `logrecord` VALUES (113, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:34:20', 1);
INSERT INTO `logrecord` VALUES (114, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-31 15:34:27', 2);
INSERT INTO `logrecord` VALUES (115, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:34:30', 2);
INSERT INTO `logrecord` VALUES (116, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:36:49', 6);
INSERT INTO `logrecord` VALUES (117, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-31 15:38:52', 1);
INSERT INTO `logrecord` VALUES (118, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:40:28', 1);
INSERT INTO `logrecord` VALUES (119, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-31 15:40:37', 2);
INSERT INTO `logrecord` VALUES (120, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-31 15:40:44', 2);
INSERT INTO `logrecord` VALUES (121, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:49:15', 4);
INSERT INTO `logrecord` VALUES (122, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:49:16', 1);
INSERT INTO `logrecord` VALUES (123, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-31 15:49:17', 2);
INSERT INTO `logrecord` VALUES (124, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-31 15:52:17', 2);
INSERT INTO `logrecord` VALUES (125, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-31 15:52:52', 1);
INSERT INTO `logrecord` VALUES (126, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-31 15:52:55', 2);
INSERT INTO `logrecord` VALUES (127, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:53:13', 2);
INSERT INTO `logrecord` VALUES (128, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2024-12-31 15:53:14', 2);
INSERT INTO `logrecord` VALUES (129, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:53:17', 2);
INSERT INTO `logrecord` VALUES (130, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 15:53:19', 1);
INSERT INTO `logrecord` VALUES (131, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 20:50:14', 9);
INSERT INTO `logrecord` VALUES (132, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2024-12-31 22:44:53', 3);
INSERT INTO `logrecord` VALUES (133, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2024-12-31 22:48:53', 2);
INSERT INTO `logrecord` VALUES (134, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 01:10:20', 4);
INSERT INTO `logrecord` VALUES (135, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 01:10:33', 3);
INSERT INTO `logrecord` VALUES (136, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 01:29:50', 5);
INSERT INTO `logrecord` VALUES (137, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 01:45:58', 2);
INSERT INTO `logrecord` VALUES (138, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:45:59', 0);
INSERT INTO `logrecord` VALUES (139, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:46:46', 0);
INSERT INTO `logrecord` VALUES (140, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:47:45', 1);
INSERT INTO `logrecord` VALUES (141, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:48:01', 2);
INSERT INTO `logrecord` VALUES (142, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:48:29', 1);
INSERT INTO `logrecord` VALUES (143, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:49:18', 1);
INSERT INTO `logrecord` VALUES (144, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:49:28', 2);
INSERT INTO `logrecord` VALUES (145, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:50:27', 0);
INSERT INTO `logrecord` VALUES (146, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:50:30', 1);
INSERT INTO `logrecord` VALUES (147, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:51:13', 1);
INSERT INTO `logrecord` VALUES (148, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:51:31', 0);
INSERT INTO `logrecord` VALUES (149, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:52:42', 1);
INSERT INTO `logrecord` VALUES (150, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:53:35', 2);
INSERT INTO `logrecord` VALUES (151, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:55:32', 1);
INSERT INTO `logrecord` VALUES (152, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:55:59', 1);
INSERT INTO `logrecord` VALUES (153, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:56:42', 0);
INSERT INTO `logrecord` VALUES (154, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:57:38', 0);
INSERT INTO `logrecord` VALUES (155, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:58:37', 0);
INSERT INTO `logrecord` VALUES (156, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:58:46', 1);
INSERT INTO `logrecord` VALUES (157, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 01:58:53', 1);
INSERT INTO `logrecord` VALUES (158, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:58:55', 1);
INSERT INTO `logrecord` VALUES (159, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 01:59:32', 0);
INSERT INTO `logrecord` VALUES (160, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:00:31', 1);
INSERT INTO `logrecord` VALUES (161, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:05:09', 1);
INSERT INTO `logrecord` VALUES (162, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:05:16', 1);
INSERT INTO `logrecord` VALUES (163, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:05:17', 1);
INSERT INTO `logrecord` VALUES (164, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:05:18', 1);
INSERT INTO `logrecord` VALUES (165, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:05:20', 2);
INSERT INTO `logrecord` VALUES (166, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:06:12', 1);
INSERT INTO `logrecord` VALUES (167, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:09:28', 2);
INSERT INTO `logrecord` VALUES (168, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:09:31', 2);
INSERT INTO `logrecord` VALUES (169, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:09:40', 2);
INSERT INTO `logrecord` VALUES (170, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:09:42', 1);
INSERT INTO `logrecord` VALUES (171, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:10:36', 1);
INSERT INTO `logrecord` VALUES (172, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:10:42', 1);
INSERT INTO `logrecord` VALUES (173, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:15:13', 1);
INSERT INTO `logrecord` VALUES (174, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:15:13', 2);
INSERT INTO `logrecord` VALUES (175, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:15:22', 1);
INSERT INTO `logrecord` VALUES (176, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:15:23', 2);
INSERT INTO `logrecord` VALUES (177, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:16:52', 0);
INSERT INTO `logrecord` VALUES (178, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:17:19', 1);
INSERT INTO `logrecord` VALUES (179, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:17:39', 1);
INSERT INTO `logrecord` VALUES (180, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:17:48', 0);
INSERT INTO `logrecord` VALUES (181, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:18:12', 1);
INSERT INTO `logrecord` VALUES (182, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:21:12', 1);
INSERT INTO `logrecord` VALUES (183, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:24:53', 1);
INSERT INTO `logrecord` VALUES (184, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:27:39', 2);
INSERT INTO `logrecord` VALUES (185, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:29:26', 0);
INSERT INTO `logrecord` VALUES (186, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:30:44', 1);
INSERT INTO `logrecord` VALUES (187, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:31:03', 0);
INSERT INTO `logrecord` VALUES (188, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:31:04', 1);
INSERT INTO `logrecord` VALUES (189, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:31:05', 1);
INSERT INTO `logrecord` VALUES (190, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:31:06', 5);
INSERT INTO `logrecord` VALUES (191, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:31:33', 1);
INSERT INTO `logrecord` VALUES (192, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:31:34', 1);
INSERT INTO `logrecord` VALUES (193, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:31:51', 0);
INSERT INTO `logrecord` VALUES (194, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:33:14', 1);
INSERT INTO `logrecord` VALUES (195, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:33:35', 1);
INSERT INTO `logrecord` VALUES (196, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:34:05', 0);
INSERT INTO `logrecord` VALUES (197, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:34:08', 1);
INSERT INTO `logrecord` VALUES (198, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:35:05', 1);
INSERT INTO `logrecord` VALUES (199, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:35:08', 0);
INSERT INTO `logrecord` VALUES (200, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:35:33', 1);
INSERT INTO `logrecord` VALUES (201, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:35:35', 0);
INSERT INTO `logrecord` VALUES (202, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:36:31', 0);
INSERT INTO `logrecord` VALUES (203, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:48:43', 0);
INSERT INTO `logrecord` VALUES (204, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:49:13', 0);
INSERT INTO `logrecord` VALUES (205, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:50:11', 1);
INSERT INTO `logrecord` VALUES (206, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:50:33', 1);
INSERT INTO `logrecord` VALUES (207, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:51:27', 1);
INSERT INTO `logrecord` VALUES (208, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:53:20', 2);
INSERT INTO `logrecord` VALUES (209, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:54:10', 1);
INSERT INTO `logrecord` VALUES (210, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:54:12', 2);
INSERT INTO `logrecord` VALUES (211, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:54:23', 2);
INSERT INTO `logrecord` VALUES (212, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:54:51', 0);
INSERT INTO `logrecord` VALUES (213, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:54:55', 0);
INSERT INTO `logrecord` VALUES (214, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:55:47', 1);
INSERT INTO `logrecord` VALUES (215, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 02:56:14', 1);
INSERT INTO `logrecord` VALUES (216, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:56:16', 2);
INSERT INTO `logrecord` VALUES (217, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 02:58:50', 1);
INSERT INTO `logrecord` VALUES (218, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:03:10', 1);
INSERT INTO `logrecord` VALUES (219, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:03:58', 1);
INSERT INTO `logrecord` VALUES (220, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:09:14', 3);
INSERT INTO `logrecord` VALUES (221, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:09:21', 1);
INSERT INTO `logrecord` VALUES (222, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:10:18', 1);
INSERT INTO `logrecord` VALUES (223, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:14:31', 3);
INSERT INTO `logrecord` VALUES (224, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:14:31', 1);
INSERT INTO `logrecord` VALUES (225, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:14:34', 1);
INSERT INTO `logrecord` VALUES (226, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:14:35', 2);
INSERT INTO `logrecord` VALUES (227, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:15:05', 3);
INSERT INTO `logrecord` VALUES (228, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:16:15', 0);
INSERT INTO `logrecord` VALUES (229, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:20:15', 1);
INSERT INTO `logrecord` VALUES (230, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:21:11', 1);
INSERT INTO `logrecord` VALUES (231, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:24:15', 2);
INSERT INTO `logrecord` VALUES (232, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:24:36', 2);
INSERT INTO `logrecord` VALUES (233, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:25:08', 1);
INSERT INTO `logrecord` VALUES (234, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:28:34', 1);
INSERT INTO `logrecord` VALUES (235, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:28:35', 0);
INSERT INTO `logrecord` VALUES (236, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:29:19', 0);
INSERT INTO `logrecord` VALUES (237, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:29:33', 0);
INSERT INTO `logrecord` VALUES (238, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:31:03', 2);
INSERT INTO `logrecord` VALUES (239, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:31:04', 0);
INSERT INTO `logrecord` VALUES (240, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 03:31:16', 1);
INSERT INTO `logrecord` VALUES (241, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:31:57', 2);
INSERT INTO `logrecord` VALUES (242, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:32:02', 1);
INSERT INTO `logrecord` VALUES (243, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:32:03', 1);
INSERT INTO `logrecord` VALUES (244, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:32:15', 2);
INSERT INTO `logrecord` VALUES (245, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:32:18', 1);
INSERT INTO `logrecord` VALUES (246, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:32:19', 2);
INSERT INTO `logrecord` VALUES (247, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 03:32:30', 2);
INSERT INTO `logrecord` VALUES (248, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 13:43:42', 3);
INSERT INTO `logrecord` VALUES (249, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 13:43:42', 1);
INSERT INTO `logrecord` VALUES (250, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 13:43:42', 1);
INSERT INTO `logrecord` VALUES (251, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 13:43:56', 1);
INSERT INTO `logrecord` VALUES (252, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 13:48:12', 1);
INSERT INTO `logrecord` VALUES (253, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 13:48:13', 1);
INSERT INTO `logrecord` VALUES (254, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:48:14', 1);
INSERT INTO `logrecord` VALUES (255, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 13:48:18', 2);
INSERT INTO `logrecord` VALUES (256, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:48:19', 1);
INSERT INTO `logrecord` VALUES (257, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:48:26', 1);
INSERT INTO `logrecord` VALUES (258, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:49:50', 1);
INSERT INTO `logrecord` VALUES (259, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:49:56', 1);
INSERT INTO `logrecord` VALUES (260, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:50:09', 1);
INSERT INTO `logrecord` VALUES (261, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:50:12', 1);
INSERT INTO `logrecord` VALUES (262, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:50:18', 1);
INSERT INTO `logrecord` VALUES (263, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:50:46', 2);
INSERT INTO `logrecord` VALUES (264, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 13:57:30', 1);
INSERT INTO `logrecord` VALUES (265, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:02:42', 1);
INSERT INTO `logrecord` VALUES (266, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:02:59', 1);
INSERT INTO `logrecord` VALUES (267, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:06:22', 1);
INSERT INTO `logrecord` VALUES (268, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:06:33', 2);
INSERT INTO `logrecord` VALUES (269, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:07:18', 1);
INSERT INTO `logrecord` VALUES (270, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:10:19', 1);
INSERT INTO `logrecord` VALUES (271, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:28:30', 1);
INSERT INTO `logrecord` VALUES (272, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:29:08', 1);
INSERT INTO `logrecord` VALUES (273, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:30:13', 1);
INSERT INTO `logrecord` VALUES (274, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:32:09', 1);
INSERT INTO `logrecord` VALUES (275, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:32:34', 2);
INSERT INTO `logrecord` VALUES (276, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:32:52', 1);
INSERT INTO `logrecord` VALUES (277, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:33:31', 1);
INSERT INTO `logrecord` VALUES (278, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:34:03', 1);
INSERT INTO `logrecord` VALUES (279, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:35:00', 1);
INSERT INTO `logrecord` VALUES (280, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:35:23', 1);
INSERT INTO `logrecord` VALUES (281, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:37:04', 1);
INSERT INTO `logrecord` VALUES (282, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:38:14', 1);
INSERT INTO `logrecord` VALUES (283, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:42:06', 1);
INSERT INTO `logrecord` VALUES (284, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:42:28', 0);
INSERT INTO `logrecord` VALUES (285, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:43:03', 0);
INSERT INTO `logrecord` VALUES (286, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:44:55', 0);
INSERT INTO `logrecord` VALUES (287, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:45:09', 1);
INSERT INTO `logrecord` VALUES (288, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:46:02', 1);
INSERT INTO `logrecord` VALUES (289, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:47:50', 1);
INSERT INTO `logrecord` VALUES (290, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:50:54', 1);
INSERT INTO `logrecord` VALUES (291, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:55:14', 2);
INSERT INTO `logrecord` VALUES (292, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 14:57:58', 2);
INSERT INTO `logrecord` VALUES (293, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:00:26', 1);
INSERT INTO `logrecord` VALUES (294, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:01:51', 0);
INSERT INTO `logrecord` VALUES (295, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:02:10', 0);
INSERT INTO `logrecord` VALUES (296, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:02:38', 1);
INSERT INTO `logrecord` VALUES (297, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:06:07', 0);
INSERT INTO `logrecord` VALUES (298, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:06:42', 2);
INSERT INTO `logrecord` VALUES (299, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:06:43', 1);
INSERT INTO `logrecord` VALUES (300, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:07:01', 1);
INSERT INTO `logrecord` VALUES (301, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:07:02', 2);
INSERT INTO `logrecord` VALUES (302, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:07:08', 1);
INSERT INTO `logrecord` VALUES (303, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:07:09', 1);
INSERT INTO `logrecord` VALUES (304, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:07:12', 1);
INSERT INTO `logrecord` VALUES (305, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:07:13', 2);
INSERT INTO `logrecord` VALUES (306, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:07:18', 1);
INSERT INTO `logrecord` VALUES (307, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:07:20', 1);
INSERT INTO `logrecord` VALUES (308, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:07:28', 1);
INSERT INTO `logrecord` VALUES (309, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:07:33', 2);
INSERT INTO `logrecord` VALUES (310, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:07:36', 1);
INSERT INTO `logrecord` VALUES (311, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:08:09', 1);
INSERT INTO `logrecord` VALUES (312, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:08:26', 1);
INSERT INTO `logrecord` VALUES (313, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:08:28', 1);
INSERT INTO `logrecord` VALUES (314, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:08:42', 1);
INSERT INTO `logrecord` VALUES (315, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:08:44', 0);
INSERT INTO `logrecord` VALUES (316, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:08:48', 0);
INSERT INTO `logrecord` VALUES (317, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:08:49', 2);
INSERT INTO `logrecord` VALUES (318, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:14:42', 0);
INSERT INTO `logrecord` VALUES (319, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:14:48', 1);
INSERT INTO `logrecord` VALUES (320, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:16:07', 0);
INSERT INTO `logrecord` VALUES (321, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:18:45', 6);
INSERT INTO `logrecord` VALUES (322, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:20:06', 2);
INSERT INTO `logrecord` VALUES (323, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:20:06', 2);
INSERT INTO `logrecord` VALUES (324, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:20:08', 1);
INSERT INTO `logrecord` VALUES (325, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:22:10', 1);
INSERT INTO `logrecord` VALUES (326, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:22:22', 1);
INSERT INTO `logrecord` VALUES (327, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:22:31', 1);
INSERT INTO `logrecord` VALUES (328, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:23:09', 1);
INSERT INTO `logrecord` VALUES (329, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:23:32', 1);
INSERT INTO `logrecord` VALUES (330, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:23:33', 1);
INSERT INTO `logrecord` VALUES (331, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:23:38', 2);
INSERT INTO `logrecord` VALUES (332, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:25:01', 1);
INSERT INTO `logrecord` VALUES (333, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:25:25', 0);
INSERT INTO `logrecord` VALUES (334, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:25:29', 0);
INSERT INTO `logrecord` VALUES (335, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:25:31', 1);
INSERT INTO `logrecord` VALUES (336, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:25:33', 2);
INSERT INTO `logrecord` VALUES (337, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:25:34', 2);
INSERT INTO `logrecord` VALUES (338, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:25:37', 2);
INSERT INTO `logrecord` VALUES (339, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:25:39', 1);
INSERT INTO `logrecord` VALUES (340, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:25:48', 1);
INSERT INTO `logrecord` VALUES (341, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:10', 1);
INSERT INTO `logrecord` VALUES (342, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:12', 1);
INSERT INTO `logrecord` VALUES (343, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:14', 1);
INSERT INTO `logrecord` VALUES (344, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:16', 0);
INSERT INTO `logrecord` VALUES (345, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:16', 1);
INSERT INTO `logrecord` VALUES (346, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:18', 1);
INSERT INTO `logrecord` VALUES (347, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:27', 1);
INSERT INTO `logrecord` VALUES (348, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:31', 0);
INSERT INTO `logrecord` VALUES (349, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:26:34', 1);
INSERT INTO `logrecord` VALUES (350, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:26:40', 1);
INSERT INTO `logrecord` VALUES (351, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:26:43', 2);
INSERT INTO `logrecord` VALUES (352, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:26:45', 1);
INSERT INTO `logrecord` VALUES (353, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:26:47', 1);
INSERT INTO `logrecord` VALUES (354, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:26:49', 1);
INSERT INTO `logrecord` VALUES (355, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:28:14', 1);
INSERT INTO `logrecord` VALUES (356, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:29:55', 0);
INSERT INTO `logrecord` VALUES (357, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:30:00', 2);
INSERT INTO `logrecord` VALUES (358, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:30:02', 0);
INSERT INTO `logrecord` VALUES (359, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:30:04', 1);
INSERT INTO `logrecord` VALUES (360, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:30:06', 1);
INSERT INTO `logrecord` VALUES (361, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:30:12', 1);
INSERT INTO `logrecord` VALUES (362, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:31:32', 0);
INSERT INTO `logrecord` VALUES (363, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:31:35', 0);
INSERT INTO `logrecord` VALUES (364, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:33:57', 0);
INSERT INTO `logrecord` VALUES (365, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:34:01', 0);
INSERT INTO `logrecord` VALUES (366, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:34:03', 1);
INSERT INTO `logrecord` VALUES (367, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:34:04', 0);
INSERT INTO `logrecord` VALUES (368, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:34:06', 1);
INSERT INTO `logrecord` VALUES (369, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:35:59', 1);
INSERT INTO `logrecord` VALUES (370, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:36:02', 1);
INSERT INTO `logrecord` VALUES (371, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:36:02', 1);
INSERT INTO `logrecord` VALUES (372, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:36:08', 1);
INSERT INTO `logrecord` VALUES (373, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:36:11', 1);
INSERT INTO `logrecord` VALUES (374, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:36:20', 1);
INSERT INTO `logrecord` VALUES (375, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:36:22', 2);
INSERT INTO `logrecord` VALUES (376, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:37:04', 1);
INSERT INTO `logrecord` VALUES (377, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:37:04', 0);
INSERT INTO `logrecord` VALUES (378, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:37:05', 2);
INSERT INTO `logrecord` VALUES (379, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:37:08', 1);
INSERT INTO `logrecord` VALUES (380, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:37:09', 1);
INSERT INTO `logrecord` VALUES (381, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:37:13', 1);
INSERT INTO `logrecord` VALUES (382, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:37:14', 1);
INSERT INTO `logrecord` VALUES (383, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:37:19', 1);
INSERT INTO `logrecord` VALUES (384, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:38:10', 1);
INSERT INTO `logrecord` VALUES (385, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:38:23', 1);
INSERT INTO `logrecord` VALUES (386, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:53:28', 1);
INSERT INTO `logrecord` VALUES (387, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:53:36', 0);
INSERT INTO `logrecord` VALUES (388, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 15:53:37', 1);
INSERT INTO `logrecord` VALUES (389, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:55:39', 0);
INSERT INTO `logrecord` VALUES (390, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:55:41', 2);
INSERT INTO `logrecord` VALUES (391, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 15:55:42', 1);
INSERT INTO `logrecord` VALUES (392, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 15:55:44', 1);
INSERT INTO `logrecord` VALUES (393, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 17:04:28', 2);
INSERT INTO `logrecord` VALUES (394, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 17:04:31', 1);
INSERT INTO `logrecord` VALUES (395, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 17:36:20', 2);
INSERT INTO `logrecord` VALUES (396, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 17:37:07', 1);
INSERT INTO `logrecord` VALUES (397, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 17:37:23', 1);
INSERT INTO `logrecord` VALUES (398, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 17:38:04', 1);
INSERT INTO `logrecord` VALUES (399, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 17:42:42', 5);
INSERT INTO `logrecord` VALUES (400, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 17:42:43', 1);
INSERT INTO `logrecord` VALUES (401, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-01 17:43:08', 1);
INSERT INTO `logrecord` VALUES (402, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 17:44:15', 1);
INSERT INTO `logrecord` VALUES (403, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-01 17:45:46', 1);
INSERT INTO `logrecord` VALUES (404, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-01 17:45:47', 1);
INSERT INTO `logrecord` VALUES (405, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 01:16:58', 5);
INSERT INTO `logrecord` VALUES (406, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 01:17:08', 1);
INSERT INTO `logrecord` VALUES (407, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 01:17:12', 1);
INSERT INTO `logrecord` VALUES (408, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 01:17:16', 2);
INSERT INTO `logrecord` VALUES (409, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 01:17:21', 1);
INSERT INTO `logrecord` VALUES (410, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 01:17:29', 4);
INSERT INTO `logrecord` VALUES (411, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 01:17:37', 2);
INSERT INTO `logrecord` VALUES (412, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 01:21:05', 1);
INSERT INTO `logrecord` VALUES (413, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 01:21:12', 2);
INSERT INTO `logrecord` VALUES (414, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 01:21:57', 2);
INSERT INTO `logrecord` VALUES (415, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 02:52:43', 7);
INSERT INTO `logrecord` VALUES (416, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 02:53:30', 3);
INSERT INTO `logrecord` VALUES (417, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 02:53:35', 1);
INSERT INTO `logrecord` VALUES (418, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 02:53:42', 6);
INSERT INTO `logrecord` VALUES (419, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 02:53:44', 2);
INSERT INTO `logrecord` VALUES (420, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 02:53:49', 1);
INSERT INTO `logrecord` VALUES (421, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 02:53:51', 3);
INSERT INTO `logrecord` VALUES (422, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 02:53:55', 2);
INSERT INTO `logrecord` VALUES (423, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 02:53:59', 2);
INSERT INTO `logrecord` VALUES (424, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 02:54:10', 1);
INSERT INTO `logrecord` VALUES (425, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 02:54:32', 1);
INSERT INTO `logrecord` VALUES (426, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 03:01:10', 1);
INSERT INTO `logrecord` VALUES (427, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:01:13', 2);
INSERT INTO `logrecord` VALUES (428, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:01:16', 2);
INSERT INTO `logrecord` VALUES (429, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:01:48', 2);
INSERT INTO `logrecord` VALUES (430, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 03:01:53', 2);
INSERT INTO `logrecord` VALUES (431, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:01:56', 1);
INSERT INTO `logrecord` VALUES (432, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:02:05', 2);
INSERT INTO `logrecord` VALUES (433, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:02:54', 1);
INSERT INTO `logrecord` VALUES (434, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:03:40', 1);
INSERT INTO `logrecord` VALUES (435, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:04:04', 1);
INSERT INTO `logrecord` VALUES (436, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:04:32', 2);
INSERT INTO `logrecord` VALUES (437, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 03:05:21', 1);
INSERT INTO `logrecord` VALUES (438, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:05:21', 2);
INSERT INTO `logrecord` VALUES (439, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:05:26', 1);
INSERT INTO `logrecord` VALUES (440, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:05:36', 1);
INSERT INTO `logrecord` VALUES (441, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:05:52', 1);
INSERT INTO `logrecord` VALUES (442, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:05:59', 1);
INSERT INTO `logrecord` VALUES (443, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:06:17', 1);
INSERT INTO `logrecord` VALUES (444, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:06:20', 1);
INSERT INTO `logrecord` VALUES (445, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:06:22', 2);
INSERT INTO `logrecord` VALUES (446, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 03:06:27', 1);
INSERT INTO `logrecord` VALUES (447, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:06:32', 1);
INSERT INTO `logrecord` VALUES (448, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:07:03', 1);
INSERT INTO `logrecord` VALUES (449, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:07:11', 1);
INSERT INTO `logrecord` VALUES (450, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:07:33', 0);
INSERT INTO `logrecord` VALUES (451, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:07:41', 1);
INSERT INTO `logrecord` VALUES (452, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:07:56', 1);
INSERT INTO `logrecord` VALUES (453, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:07:59', 1);
INSERT INTO `logrecord` VALUES (454, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:08:46', 1);
INSERT INTO `logrecord` VALUES (455, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:08:56', 1);
INSERT INTO `logrecord` VALUES (456, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:09:56', 1);
INSERT INTO `logrecord` VALUES (457, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 03:10:33', 1);
INSERT INTO `logrecord` VALUES (458, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:10:33', 1);
INSERT INTO `logrecord` VALUES (459, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:10:37', 1);
INSERT INTO `logrecord` VALUES (460, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 03:11:15', 1);
INSERT INTO `logrecord` VALUES (461, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:11:15', 1);
INSERT INTO `logrecord` VALUES (462, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:11:17', 1);
INSERT INTO `logrecord` VALUES (463, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:13:28', 3);
INSERT INTO `logrecord` VALUES (464, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:15:04', 1);
INSERT INTO `logrecord` VALUES (465, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:15:10', 2);
INSERT INTO `logrecord` VALUES (466, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:15:16', 2);
INSERT INTO `logrecord` VALUES (467, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:15:18', 0);
INSERT INTO `logrecord` VALUES (468, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:15:23', 2);
INSERT INTO `logrecord` VALUES (469, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:15:53', 1);
INSERT INTO `logrecord` VALUES (470, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:17:16', 2);
INSERT INTO `logrecord` VALUES (471, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:20:11', 3);
INSERT INTO `logrecord` VALUES (472, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:20:11', 2);
INSERT INTO `logrecord` VALUES (473, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:21:54', 3);
INSERT INTO `logrecord` VALUES (474, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:23:33', 2);
INSERT INTO `logrecord` VALUES (475, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:24:23', 2);
INSERT INTO `logrecord` VALUES (476, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:36:34', 2);
INSERT INTO `logrecord` VALUES (477, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:36:47', 1);
INSERT INTO `logrecord` VALUES (478, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:36:54', 2);
INSERT INTO `logrecord` VALUES (479, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:37:01', 2);
INSERT INTO `logrecord` VALUES (480, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 03:37:26', 2);
INSERT INTO `logrecord` VALUES (481, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:37:26', 4);
INSERT INTO `logrecord` VALUES (482, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:37:28', 4);
INSERT INTO `logrecord` VALUES (483, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:37:51', 1);
INSERT INTO `logrecord` VALUES (484, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:41:24', 3);
INSERT INTO `logrecord` VALUES (485, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 03:41:46', 2);
INSERT INTO `logrecord` VALUES (486, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:41:46', 3);
INSERT INTO `logrecord` VALUES (487, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:41:48', 4);
INSERT INTO `logrecord` VALUES (488, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:45:05', 3);
INSERT INTO `logrecord` VALUES (489, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:54:13', 1);
INSERT INTO `logrecord` VALUES (490, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:54:20', 1);
INSERT INTO `logrecord` VALUES (491, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:54:22', 1);
INSERT INTO `logrecord` VALUES (492, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 03:54:37', 3);
INSERT INTO `logrecord` VALUES (493, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:54:37', 1);
INSERT INTO `logrecord` VALUES (494, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:54:39', 2);
INSERT INTO `logrecord` VALUES (495, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:54:49', 1);
INSERT INTO `logrecord` VALUES (496, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:58:12', 1);
INSERT INTO `logrecord` VALUES (497, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:58:16', 1);
INSERT INTO `logrecord` VALUES (498, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:58:42', 2);
INSERT INTO `logrecord` VALUES (499, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:58:56', 3);
INSERT INTO `logrecord` VALUES (500, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:59:01', 1);
INSERT INTO `logrecord` VALUES (501, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 03:59:15', 1);
INSERT INTO `logrecord` VALUES (502, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:59:21', 2);
INSERT INTO `logrecord` VALUES (503, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 03:59:37', 1);
INSERT INTO `logrecord` VALUES (504, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:00:10', 1);
INSERT INTO `logrecord` VALUES (505, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:00:12', 1);
INSERT INTO `logrecord` VALUES (506, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:01:25', 3);
INSERT INTO `logrecord` VALUES (507, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:01:40', 1);
INSERT INTO `logrecord` VALUES (508, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 04:01:59', 0);
INSERT INTO `logrecord` VALUES (509, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:01:59', 1);
INSERT INTO `logrecord` VALUES (510, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:02:02', 0);
INSERT INTO `logrecord` VALUES (511, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:02:06', 1);
INSERT INTO `logrecord` VALUES (512, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:02:42', 1);
INSERT INTO `logrecord` VALUES (513, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:02:57', 1);
INSERT INTO `logrecord` VALUES (514, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:03:00', 1);
INSERT INTO `logrecord` VALUES (515, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:05:50', 1);
INSERT INTO `logrecord` VALUES (516, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:05:50', 1);
INSERT INTO `logrecord` VALUES (517, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:06:02', 0);
INSERT INTO `logrecord` VALUES (518, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:07:19', 0);
INSERT INTO `logrecord` VALUES (519, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:07:25', 2);
INSERT INTO `logrecord` VALUES (520, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:07:30', 1);
INSERT INTO `logrecord` VALUES (521, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 04:07:52', 1);
INSERT INTO `logrecord` VALUES (522, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:07:52', 1);
INSERT INTO `logrecord` VALUES (523, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:07:54', 1);
INSERT INTO `logrecord` VALUES (524, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:07:55', 2);
INSERT INTO `logrecord` VALUES (525, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:07:59', 2);
INSERT INTO `logrecord` VALUES (526, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:08:10', 1);
INSERT INTO `logrecord` VALUES (527, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:08:22', 0);
INSERT INTO `logrecord` VALUES (528, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-02 04:08:40', 1);
INSERT INTO `logrecord` VALUES (529, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:08:40', 1);
INSERT INTO `logrecord` VALUES (530, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:09:04', 2);
INSERT INTO `logrecord` VALUES (531, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:10:09', 1);
INSERT INTO `logrecord` VALUES (532, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-02 04:10:16', 1);
INSERT INTO `logrecord` VALUES (533, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:10:18', 2);
INSERT INTO `logrecord` VALUES (534, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 04:10:20', 1);
INSERT INTO `logrecord` VALUES (535, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 04:10:22', 1);
INSERT INTO `logrecord` VALUES (536, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 23:44:14', 6);
INSERT INTO `logrecord` VALUES (537, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 23:44:56', 2);
INSERT INTO `logrecord` VALUES (538, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 23:44:59', 1);
INSERT INTO `logrecord` VALUES (539, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-02 23:45:01', 2);
INSERT INTO `logrecord` VALUES (540, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-02 23:45:04', 2);
INSERT INTO `logrecord` VALUES (541, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 00:04:57', 2);
INSERT INTO `logrecord` VALUES (542, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 00:24:57', 2);
INSERT INTO `logrecord` VALUES (543, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 00:25:04', 1);
INSERT INTO `logrecord` VALUES (544, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 00:30:02', 1);
INSERT INTO `logrecord` VALUES (545, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 00:30:08', 1);
INSERT INTO `logrecord` VALUES (546, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 00:30:11', 2);
INSERT INTO `logrecord` VALUES (547, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 00:54:17', 3);
INSERT INTO `logrecord` VALUES (548, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:11:28', 2);
INSERT INTO `logrecord` VALUES (549, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:11:34', 2);
INSERT INTO `logrecord` VALUES (550, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:11:37', 2);
INSERT INTO `logrecord` VALUES (551, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:11:38', 2);
INSERT INTO `logrecord` VALUES (552, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:12:02', 3);
INSERT INTO `logrecord` VALUES (553, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:12:15', 2);
INSERT INTO `logrecord` VALUES (554, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:12:33', 1);
INSERT INTO `logrecord` VALUES (555, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'addArticle', '2025-01-03 01:12:58', 2);
INSERT INTO `logrecord` VALUES (556, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:12:58', 2);
INSERT INTO `logrecord` VALUES (557, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:13:13', 2);
INSERT INTO `logrecord` VALUES (558, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:13:15', 2);
INSERT INTO `logrecord` VALUES (559, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:13:24', 2);
INSERT INTO `logrecord` VALUES (560, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:13:27', 1);
INSERT INTO `logrecord` VALUES (561, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:13:37', 2);
INSERT INTO `logrecord` VALUES (562, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:13:43', 2);
INSERT INTO `logrecord` VALUES (563, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:13:45', 3);
INSERT INTO `logrecord` VALUES (564, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:13:53', 2);
INSERT INTO `logrecord` VALUES (565, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:13:54', 1);
INSERT INTO `logrecord` VALUES (566, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:13:55', 2);
INSERT INTO `logrecord` VALUES (567, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'updateArticle', '2025-01-03 01:14:00', 1);
INSERT INTO `logrecord` VALUES (568, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:14:00', 2);
INSERT INTO `logrecord` VALUES (569, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:14:00', 2);
INSERT INTO `logrecord` VALUES (570, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:14:02', 1);
INSERT INTO `logrecord` VALUES (571, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:14:25', 2);
INSERT INTO `logrecord` VALUES (572, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:14:26', 1);
INSERT INTO `logrecord` VALUES (573, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:14:29', 1);
INSERT INTO `logrecord` VALUES (574, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:14:30', 1);
INSERT INTO `logrecord` VALUES (575, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:14:32', 2);
INSERT INTO `logrecord` VALUES (576, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:14:36', 1);
INSERT INTO `logrecord` VALUES (577, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:14:40', 2);
INSERT INTO `logrecord` VALUES (578, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:14:41', 2);
INSERT INTO `logrecord` VALUES (579, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:14:42', 1);
INSERT INTO `logrecord` VALUES (580, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:14:44', 1);
INSERT INTO `logrecord` VALUES (581, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:14:48', 1);
INSERT INTO `logrecord` VALUES (582, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:14:53', 1);
INSERT INTO `logrecord` VALUES (583, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:17:30', 1);
INSERT INTO `logrecord` VALUES (584, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:19:34', 2);
INSERT INTO `logrecord` VALUES (585, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:19:37', 2);
INSERT INTO `logrecord` VALUES (586, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:19:39', 1);
INSERT INTO `logrecord` VALUES (587, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:19:41', 1);
INSERT INTO `logrecord` VALUES (588, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:19:43', 1);
INSERT INTO `logrecord` VALUES (589, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:19:45', 1);
INSERT INTO `logrecord` VALUES (590, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:19:47', 1);
INSERT INTO `logrecord` VALUES (591, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:19:48', 1);
INSERT INTO `logrecord` VALUES (592, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:19:50', 1);
INSERT INTO `logrecord` VALUES (593, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:19:53', 2);
INSERT INTO `logrecord` VALUES (594, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:19:55', 2);
INSERT INTO `logrecord` VALUES (595, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:20:10', 1);
INSERT INTO `logrecord` VALUES (596, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:12', 0);
INSERT INTO `logrecord` VALUES (597, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:18', 3);
INSERT INTO `logrecord` VALUES (598, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:20:20', 2);
INSERT INTO `logrecord` VALUES (599, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:22', 1);
INSERT INTO `logrecord` VALUES (600, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:31', 2);
INSERT INTO `logrecord` VALUES (601, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:20:33', 1);
INSERT INTO `logrecord` VALUES (602, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:35', 2);
INSERT INTO `logrecord` VALUES (603, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:44', 2);
INSERT INTO `logrecord` VALUES (604, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:20:46', 1);
INSERT INTO `logrecord` VALUES (605, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:51', 2);
INSERT INTO `logrecord` VALUES (606, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:20:52', 1);
INSERT INTO `logrecord` VALUES (607, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:53', 1);
INSERT INTO `logrecord` VALUES (608, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:20:55', 1);
INSERT INTO `logrecord` VALUES (609, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:20:57', 1);
INSERT INTO `logrecord` VALUES (610, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:22:06', 1);
INSERT INTO `logrecord` VALUES (611, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:22:09', 1);
INSERT INTO `logrecord` VALUES (612, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:22:10', 1);
INSERT INTO `logrecord` VALUES (613, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:22:14', 1);
INSERT INTO `logrecord` VALUES (614, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:22:42', 1);
INSERT INTO `logrecord` VALUES (615, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:22:45', 1);
INSERT INTO `logrecord` VALUES (616, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:22:48', 1);
INSERT INTO `logrecord` VALUES (617, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:24:48', 1);
INSERT INTO `logrecord` VALUES (618, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:24:50', 1);
INSERT INTO `logrecord` VALUES (619, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:24:52', 2);
INSERT INTO `logrecord` VALUES (620, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:25:22', 1);
INSERT INTO `logrecord` VALUES (621, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:25:33', 1);
INSERT INTO `logrecord` VALUES (622, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:25:36', 2);
INSERT INTO `logrecord` VALUES (623, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:25:37', 1);
INSERT INTO `logrecord` VALUES (624, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:25:38', 1);
INSERT INTO `logrecord` VALUES (625, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:25:44', 1);
INSERT INTO `logrecord` VALUES (626, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:25:48', 1);
INSERT INTO `logrecord` VALUES (627, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:26:12', 1);
INSERT INTO `logrecord` VALUES (628, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:26:33', 0);
INSERT INTO `logrecord` VALUES (629, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:26:39', 1);
INSERT INTO `logrecord` VALUES (630, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:26:40', 2);
INSERT INTO `logrecord` VALUES (631, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:26:41', 1);
INSERT INTO `logrecord` VALUES (632, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:26:44', 1);
INSERT INTO `logrecord` VALUES (633, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:26:46', 1);
INSERT INTO `logrecord` VALUES (634, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:26:47', 1);
INSERT INTO `logrecord` VALUES (635, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:26:49', 0);
INSERT INTO `logrecord` VALUES (636, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:26:55', 1);
INSERT INTO `logrecord` VALUES (637, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:26:58', 1);
INSERT INTO `logrecord` VALUES (638, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:27:12', 1);
INSERT INTO `logrecord` VALUES (639, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:27:13', 0);
INSERT INTO `logrecord` VALUES (640, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:27:14', 1);
INSERT INTO `logrecord` VALUES (641, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:27:23', 1);
INSERT INTO `logrecord` VALUES (642, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:28:46', 1);
INSERT INTO `logrecord` VALUES (643, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:28:48', 1);
INSERT INTO `logrecord` VALUES (644, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:28:49', 0);
INSERT INTO `logrecord` VALUES (645, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:28:50', 1);
INSERT INTO `logrecord` VALUES (646, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:29:15', 0);
INSERT INTO `logrecord` VALUES (647, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:29:19', 1);
INSERT INTO `logrecord` VALUES (648, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:29:24', 1);
INSERT INTO `logrecord` VALUES (649, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:29:26', 1);
INSERT INTO `logrecord` VALUES (650, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'updateArticle', '2025-01-03 01:29:35', 1);
INSERT INTO `logrecord` VALUES (651, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 01:29:35', 0);
INSERT INTO `logrecord` VALUES (652, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:29:35', 0);
INSERT INTO `logrecord` VALUES (653, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 01:29:40', 0);
INSERT INTO `logrecord` VALUES (654, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 01:29:47', 1);
INSERT INTO `logrecord` VALUES (655, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 16:07:06', 2);
INSERT INTO `logrecord` VALUES (656, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 20:14:59', 1);
INSERT INTO `logrecord` VALUES (657, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 20:15:24', 2);
INSERT INTO `logrecord` VALUES (658, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 20:15:48', 3);
INSERT INTO `logrecord` VALUES (659, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 20:15:52', 1);
INSERT INTO `logrecord` VALUES (660, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 20:16:24', 4);
INSERT INTO `logrecord` VALUES (661, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'getPageByConditions', '2025-01-03 20:17:03', 5);
INSERT INTO `logrecord` VALUES (662, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 20:17:23', 2);
INSERT INTO `logrecord` VALUES (663, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findById', '2025-01-03 20:17:45', 2);
INSERT INTO `logrecord` VALUES (664, 'cn.smxy.zhouxuelian8.service.ArticleServiceImpl', 'findAll', '2025-01-03 20:17:58', 2);

-- ----------------------------
-- Table structure for methodcallcount
-- ----------------------------
DROP TABLE IF EXISTS `methodcallcount`;
CREATE TABLE `methodcallcount`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `methodname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `callcount` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of methodcallcount
-- ----------------------------
INSERT INTO `methodcallcount` VALUES (1, 'getPageByConditions', 119);
INSERT INTO `methodcallcount` VALUES (2, 'findAll', 256);
INSERT INTO `methodcallcount` VALUES (3, 'findById', 259);
INSERT INTO `methodcallcount` VALUES (4, 'updateArticle', 3);
INSERT INTO `methodcallcount` VALUES (11, 'addArticle', 10);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, 'Java');
INSERT INTO `type` VALUES (2, 'C');
INSERT INTO `type` VALUES (3, 'Python');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zxl', '123', '13371231842', '256@163.com', 'admin');
INSERT INTO `user` VALUES (2, 'yn', '123', '181846777957', '23333@bilibili.com', 'user');
INSERT INTO `user` VALUES (3, 'lql', '123', '15762196518915', '21198561@qw.com', 'user');
INSERT INTO `user` VALUES (4, 'wllb', '123', '13371234648', '1239@qq.com', 'user');
INSERT INTO `user` VALUES (5, 'sjx', '123', '1234567889', '123@qq.com', 'user');
INSERT INTO `user` VALUES (6, 'lxy', '123', '123456789', '123@123.com', 'user');

SET FOREIGN_KEY_CHECKS = 1;
