To reproduce the bug

```
>> Foo.create(name: 'foo')
>> Foo.first

  Foo Load (0.3ms)  SELECT `foos`.* FROM `foos` LIMIT 1
   (0.4ms)  BEGIN
   (0.3ms)  UPDATE `foos` SET `name` = 'blahblahblahblah', `updated_at` = '2012-12-18 16:14:51' WHERE `foos`.`id` = 1
   (25.8ms)  COMMIT
  EXPLAIN (0.3ms)  EXPLAIN SELECT `foos`.* FROM `foos` LIMIT 1
  EXPLAIN (0.3ms)  EXPLAIN UPDATE `foos` SET `name` = 'blahblahblahblah', `updated_at` = '2012-12-18 16:14:51' WHERE `foos`.`id` = 1
Mysql2::Error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UPDATE `foos` SET `name` = 'blahblahblahblah', `updated_at` = '2012-12-18 16:14:' at line 1: EXPLAIN UPDATE `foos` SET `name` = 'blahblahblahblah', `updated_at` = '2012-12-18 16:14:51' WHERE `foos`.`id` = 1
ActiveRecord::StatementInvalid: Mysql2::Error: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UPDATE `foos` SET `name` = 'blahblahblahblah', `updated_at` = '2012-12-18 16:14:' at line 1: EXPLAIN UPDATE `foos` SET `name` = 'blahblahblahblah', `updated_at` = '2012-12-18 16:14:51' WHERE `foos`.`id` = 1
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/connection_adapters/abstract_mysql_adapter.rb:245:in `query'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/connection_adapters/abstract_mysql_adapter.rb:245:in `block in execute'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/connection_adapters/abstract_adapter.rb:280:in `block in log'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activesupport-3.2.9/lib/active_support/notifications/instrumenter.rb:20:in `instrument'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/connection_adapters/abstract_adapter.rb:275:in `log'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/connection_adapters/abstract_mysql_adapter.rb:245:in `execute'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/connection_adapters/mysql2_adapter.rb:211:in `execute'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/connection_adapters/mysql2_adapter.rb:215:in `exec_query'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/connection_adapters/mysql2_adapter.rb:100:in `explain'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/explain.rb:65:in `block (2 levels) in exec_explain'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/explain.rb:59:in `tap'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/explain.rb:59:in `block in exec_explain'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/explain.rb:58:in `map'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/explain.rb:58:in `exec_explain'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/explain.rb:34:in `logging_query_plan'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/relation.rb:159:in `to_a'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/relation/finder_methods.rb:378:in `find_first'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/relation/finder_methods.rb:122:in `first'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/activerecord-3.2.9/lib/active_record/querying.rb:5:in `first'
	from (irb):1
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/railties-3.2.9/lib/rails/commands/console.rb:47:in `start'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/railties-3.2.9/lib/rails/commands/console.rb:8:in `start'
	from /Users/byroot/.rvm/gems/ruby-1.9.3-p327/gems/railties-3.2.9/lib/rails/commands.rb:41:in `<top (required)>'
	from script/rails:6:in `require'
	from script/rails:6:in `<main>'

```